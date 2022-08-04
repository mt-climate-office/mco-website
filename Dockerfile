
FROM ubuntu:20.04
RUN apt-get update && \
    apt-get -y install cron && \
    apt-get install -y curl

RUN mkdir /data /processing

COPY ./processing/cronjob /etc/cron.d/cronjob
COPY ./processing/*.sh /processing

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cronjob

# Make all bash scripts executable.
RUN chmod -R 0744 /processing/*.sh

# Apply cron job
RUN crontab /etc/cron.d/cronjob

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log