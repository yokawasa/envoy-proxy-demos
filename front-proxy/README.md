# Envoy Front Proxy

This demo is fully based on Front Proxy sample in [envoyproxy official sandboxes](https://www.envoyproxy.io/docs/envoy/latest/start/sandboxes/front_proxy.html).

## Getting Started
```sh
git clone https://github.com/yokawasa/envoy-proxy-demos.git
cd envoy-proxy-demos/front-proxy
```

## Running Demos
### Simple Routing Demo
```sh
# Build and Run containers using docker-compose
$ ./buildup_simplematch.sh

# check all services are up
$ docker-compose ps --service

front-envoy
service_blue
service_green
service_red

$ docker-compose ps
           Name                          Command               State                            Ports
------------------------------------------------------------------------------------------------------------------------------
front-proxy_front-envoy_1     /usr/bin/dumb-init -- /bin ...   Up      10000/tcp, 0.0.0.0:8000->80/tcp, 0.0.0.0:8001->8001/tcp
front-proxy_service_blue_1    /bin/sh -c /usr/local/bin/ ...   Up      10000/tcp, 80/tcp
front-proxy_service_green_1   /bin/sh -c /usr/local/bin/ ...   Up      10000/tcp, 80/tcp
front-proxy_service_red_1     /bin/sh -c /usr/local/bin/ ...   Up      10000/tcp, 80/tcp
```
Access each services
```sh
# Access serivce_blue and check if blue background page is displayed
$ curl -s http://localhost:8000/service/blue

# Access serivce_gree and check if gree background page is displayed
$ curl -s http://localhost:8000/service/green

# Access serivce_red and check if red background page is displayed
$ curl -s http://localhost:8000/service/red
```

### Ruting based on Header condition demo
```sh
# Build and Run containers using docker-compose
$ ./buildup_headermatch.sh

# check all services are up
$ docker-compose ps --service

front-envoy
service_blue
service_green
service_red

$ docker-compose ps

           Name                          Command               State                            Ports
------------------------------------------------------------------------------------------------------------------------------
front-proxy_front-envoy_1     /usr/bin/dumb-init -- /bin ...   Up      10000/tcp, 0.0.0.0:8000->80/tcp, 0.0.0.0:8001->8001/tcp
front-proxy_service_blue_1    /bin/sh -c /usr/local/bin/ ...   Up      10000/tcp, 80/tcp
front-proxy_service_green_1   /bin/sh -c /usr/local/bin/ ...   Up      10000/tcp, 80/tcp
front-proxy_service_red_1     /bin/sh -c /usr/local/bin/ ...   Up      10000/tcp, 80/tcp
```

Access each services like this:
```sh
# Access serivce_blue and check if blue background page is displayed
$ curl -s http://localhost:8000/service/blue

# Access serivce_blue with Headers `x-canary-version: service_green`and check if green background page (service_green) is displayed
curl -s -H 'x-canary-version: service_green' http://localhost:8000/service/blue

# Access serivce_red and check if red background page is displayed
curl -s http://localhost:8000/service/red
```

### Blue Green Traffic Splitting Demo

```sh
# Build and Run containers using docker-compose
$ ./buildup_bluegreen.sh

# check all services are up
$ docker-compose ps --service

front-envoy
service_blue
service_green
service_red

$ docker-compose ps

           Name                          Command               State                            Ports
------------------------------------------------------------------------------------------------------------------------------
front-proxy_front-envoy_1     /usr/bin/dumb-init -- /bin ...   Up      10000/tcp, 0.0.0.0:8000->80/tcp, 0.0.0.0:8001->8001/tcp
front-proxy_service_blue_1    /bin/sh -c /usr/local/bin/ ...   Up      10000/tcp, 80/tcp
front-proxy_service_green_1   /bin/sh -c /usr/local/bin/ ...   Up      10000/tcp, 80/tcp
front-proxy_service_red_1     /bin/sh -c /usr/local/bin/ ...   Up      10000/tcp, 80/tcp
```

Access each services like this:
```sh
# Access serivce_blue and check if blue background page is displayed with 90% possibility and green background page is displayed with 10% possibility
$ curl -s http://localhost:8000/service/blue

# Access serivce_red and check if red background page is displayed
curl -s http://localhost:8000/service/red
```