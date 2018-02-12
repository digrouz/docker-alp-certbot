FROM centos:7
LABEL maintainer "DI GREGORIO Nicolas <ndigregorio@ndg-consulting.tech>"

### Environment variables
ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm' 

### Install Application
RUN yum install -y epel-release && \
    yum upgrade -y && \
    yum install -y certbot && \
    yum clean all && \
    rm -rf /tmp/* \
           /var/cache/yum/* \
           /var/tmp/*

### Volume
VOLUME ["/etc/letsencrypt"]

### Expose ports
EXPOSE 80
EXPOSE 443

### Running User: not used, managed by docker-entrypoint.sh
USER root

### Start certbot
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["certbot"]
