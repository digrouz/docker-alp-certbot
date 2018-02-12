# docker-certbot
Installs cerbot into a Linux container

![certbot](https://certbot.eff.org/images/certbot-logo-1A.svg)

## Tags
Several tags are available:
* `latest`: see `centos7`
* `centos7`: [centos7/Dokerfile](https://github.com/digrouz/docker-certbot/blob/centos7/Dockerfile)
* `alpine3.6`: [alpine3.6/Dokerfile](https://github.com/digrouz/docker-certbot/blob/alpine3.6/Dockerfile)
* `alpine3.7`: [alpine3.7/Dokerfile](https://github.com/digrouz/docker-certbot/blob/alpine3.7/Dockerfile)


## Description

Certbot is an easy-to-use automatic client that fetches and deploys SSL/TLS certificates for your webserver. Certbot was developed by EFF and others as a client for Lets Encrypt and was previously known as the official Lets Encrypt client or the Let's Encrypt Python client. Certbot will also work with any other CAs that support the ACME protocol.

https://certbot.eff.org/

## Usage
### Generating certificate
    docker run --name=certbot \
      -v /etc/localtime:/etc/localtime:ro \
      -v <path to certificates>:/etc/letsencrypt \
      -e DOCKMAIL=<mail address> \
      -e DOCKMAILDOMAINS=<domains list> \
      -e DOCKUPGRADE=<0|1> \
      -p 80:80 \
      -p 443:443 \
      digrouz/docker-certbot certbot

### Renewing certificate
    docker run --name=certbot \
      -v /etc/localtime:/etc/localtime:ro \
      -v <path to certificates>:/etc/letsencrypt \
      -e DOCKMAIL=<mail address> \
      -e DOCKMAILDOMAINS=<domains list> \
      -e DOCKUPGRADE=<0|1> \
      -p 80:80 \
      -p 443:443 \
      digrouz/docker-certbot certbot-renew


## Environment Variables

When you start the `certbot` image, you can adjust the configuration of the `certbot` instance by passing one or more environment variables on the `docker run` command line.

### `DOCKUPGRADE`

This variable is not mandatory and specifies if the container has to launch software update at startup or not. Valid values are `0` and `1`. It has default value `0`.

### `DOCKMAIL`

This variable is mandatory and specifies the mail that has to be used to generate the certificates.

### `DOCKMAILDOMAINS`

This variable is mandatory and specifies a list of domains (comma separated)  for which a certificate should be generates

## Notes

* The docker entrypoint can upgrade operating system at each startup. To enable this feature, just add `-e DOCKUPGRADE=1` at container creation.
* This container uses the `standalone` authenticator methode which  may require to stop any webserver or container that expose port `80` and/or `443`.

## Issues

If you encounter an issue please open a ticket at [github](https://github.com/digrouz/docker-certbot/issues)
