# Data Processing for the MCO website
This branch has a simple `docker` container used to fetch data from the Montana Mesonet API and save it to data.climate.umt.edu. Then, the MCO website can access the latest data and images from the API while still being served as a static site. To launch the docker container, simply run:

```{bash}
docker compose up --build -d
```

Starting the container will:
* Save data from the `latest` endpoint to `/var/data/website/assets/latest.html` every 15 minutes.
* Save the image from the `photos/aceabsar/s/` endpoint to `/var/data/website/assets/latest_photo.html` every 6 hours.
* Save data from the `stations` endpoint to `/var/data/website/assets/stations.html` every week.