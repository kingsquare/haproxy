# HAProxy docker container

A simple docker container for replacing the HAproxy part of KMT
(derived from [dockerfile/haproxy](https://registry.hub.docker.com/u/dockerfile/haproxy/) )

## Running
docker run -d -p 80:80 kingsquare/haproxy:0.1

## Custom configuration

 - The resources/haproxy.cfg is the location the container looks for to override the default config
 - The resources/ssl.pem is a PEM file with the SSL certificate