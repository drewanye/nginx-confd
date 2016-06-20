FROM daocloud.io/nginx:1.9
MAINTAINER andrew.ye@daocloud.io
RUN rm /etc/nginx/conf.d/*
RUN mkdir /etc/confd
ADD ./confd /etc/confd
#ADD https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 /bin/confd
ADD ./confd/confd /bin/
RUN chmod +x /bin/confd
ADD ./confd/start.sh /
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]

