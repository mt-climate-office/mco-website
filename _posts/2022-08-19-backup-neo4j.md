---
title: "Backing up a Dockerized Community Edition Neo4j Database"
categories:
  - Code
tags:
  - Neo4j
  - Docker
  - Backup
  - How to
author: Colin Brust
author_profile: true
wide: true
---

[Neo4j](https://neo4j.com/) is a platform for managing graph databases. The Montana Climate Office uses Neo4j Community Edition to manage a database of satellite data associated with each of our Mesonet stations (learn more on our [GitHub](https://github.com/mt-climate-office/mt-mesonet-satellite)). The database is queried by the [Montana Mesonet Dashboard](https://mesonet.climate.umt.edu/dash/) to plot and contextualize current conditions at each Mesonet station. The database is extremely performant and can query over 20 years of data at a given station in a fraction of a second! The database is stood up in a Docker container for ease of mobility and reproducibility. 

# The Problem
While we were developing the database, we ran into a roadblock when implementing a method to operationally backup the data. There are numerous tutorials online explaining how to backup a Neo4j database, but they all rely on the paid Enterprise Edition of Neo4j. The Enterprise Edition simply allows you to run the `neo4j-admin backup` command on an active database to dump the data into an archived file. In the Community Edition however, you have to use the `neo4j-admin dump` command on a stopped database to backup the data. While this seems simple enough, problems arise when using this method within a Docker container. To run the `neo4j-admin dump` command, you first have to run `neo4j stop` to stop all the databases. Because the default Neo4j Docker image depends on Neo4j to be up and running, this causes the Docker container to shut down, making it impossible to run the `neo4j-admin dump` command. 

# Our Solution
To work around this problem, we extended the Neo4j Docker image so the container wouldn't stop when Neo4j was stopped. Then, we used `cron` to run a backup script every night. Here is what the new `Dockerfile` looks like: 
```dockerfile 
FROM neo4j:4.4.8-community

RUN apt-get update && \
    apt-get -y install cron 

# Copy the backup script into the container. 
COPY ./backup.sh /opt/backup.sh

# Make a directory to store the backed up data in. 
RUN mkdir -p /dumps/neo4j

# Give execution rights on the cron job
RUN chmod u+x /opt/backup.sh

# Copy environment and shell into the crontab
RUN env >> ~/env.log
RUN echo 'PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' > /etc/crontab
RUN echo 'SHELL=/bin/bash' >> /etc/crontab

# Make our backup script run at 6am UTC every day.
RUN echo '0 6 * * * root bash -c "source $HOME/env.log; source /opt/backup.sh"' >> /etc/crontab

# Create the log file to be able to run tail.
RUN touch /var/log/cron.log

# Run the tail on the cron log so the container won't stop when Neo4j is stopped. 
CMD tail -f /var/log/cron.log
```

The backup script that is copied into the Docker container simply stops Neo4j, dumps the latest snapshot of the database into the `/dumps/neo4j` folder, then restarts Neo4j: 
```bash
#!/bin/bash
/var/lib/neo4j/bin/neo4j stop
/var/lib/neo4j/bin/neo4j-admin dump --database=neo4j --to=/dumps/neo4j/backup_$(date +%Y%m%d%H%M).dump
/var/lib/neo4j/bin/neo4j start
```

We run the Neo4j container with another Docker container that updates the database with new satellite data, so we use `docker compose` to stand up the database. Here is what the relevant portions of our `docker-compose.yml` look like: 

```yaml
version: '3.9'

services:
    neo4j:
        container_name: neo4j
        restart: on-failure
        build: ./neo4j
        volumes:
          # Map volumes to machine so data is persisted between containers.
          - /neo4j/data:/data 
          - /neo4j/logs:/logs 
          - /neo4j/import:/var/lib/neo4j/import 
          - /neo4j/plugins:/plugins
          # The db-backups volume points to an external NAS server to 
          # store the data on. 
          - db-backups:/dumps
        ports:
          - "7474:7474"
          - "7687:7687"
        env_file:
          - .env

volumes:
    db-backups:
      driver: local
      driver_opts:
        type: nfs
        o: nfsvers=4,addr=${nfsIP},nolock,soft,rw
        device: $nfsPath
```

Unfortunately, we are so far unable to find a method for starting the `cron` service that operationally runs the backups within the `Dockerfile` without breaking Neo4j. To address this, we use a deploy script that starts the container and then starts `cron` after the container is stood up: 
```bash
#!/bin/bash
# Get latest changes
git pull origin main
# Start docker containers
docker compose up --build -d
# Start cron
docker exec -it neo4j service cron start
# Make sure Neo4j is running
docker exec -it neo4j neo4j start
```

# Restoring the Database
Now, if the data get deleted, your server crashes, or anything else happens to your data, you have a backup that can be used to restore the database. To restore the database, you just have to run the `neo4j-admin load` command before deploying the database with docker compose:

```bash
docker run --interactive --tty --rm \
    --volume=path/to/data/in/docker-compose:/data \ 
    --volume=path/to/dumps/in/docker-compose:/dumps \ 
    neo4j:4.4.8 \
    neo4j-admin load --database=neo4j --from=/dumps/<name_of_latest_backup>.dump
```
Running the above command reads the latest `.dump` file and puts the data into the `/data` folder in a format that is readable by Neo4j. After running this command, running the above deploy script will stand up the database with data from the latest backup! 