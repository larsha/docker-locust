# Usage

### Create a Dockerfile
```
FROM fredriklack/docker-locust:latest
```

### Build image
```
docker build --build-arg PATH_TO_LOCUST=<path in project to locustfile.py and requirements.txt> -t locust .
```

### Start locust
```
docker run -p 8089:8089 -it --rm locust /usr/bin/locust -H <host to test>
```
