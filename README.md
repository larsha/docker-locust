# Usage

### Docker example
```
docker run -it --rm -p 8089:8089 -v `pwd`<path to locustfile.py and requirements.txt>:/locust fredriklack/docker-locust \
        /bin/ash -c "pip install -r requirements.txt && locust -H http://localhost:3000"
```

### Docker Compose example
```
version: '2'
services:
  locust:
    image: fredriklack/docker-locust
    ports:
      - "8089:8089"
    volumes:
      - <path to locustfile.py and requirements.txt>:/locust
    command: /bin/ash -c "pip install -r requirements.txt && locust -H http://web:3000"
  web:
    build:
      context: .
      dockerfile: Dockerfile.web
    ports:
      - "3000:3000"
```
