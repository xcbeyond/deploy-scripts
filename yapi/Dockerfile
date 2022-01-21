FROM node:14-alpine

LABEL maintainer xcbeyond

ENV VERSION 1.9.2

RUN mkdir /yapi && \
    wget -O /yapi/yapi.tgz http://registry.npm.taobao.org/yapi-vendor/download/yapi-vendor-$VERSION.tgz && \
    tar zxvf /yapi/yapi.tgz -C /yapi  && mv /yapi/package /yapi/vendors
RUN cd /yapi/vendors && \
    npm install --production --registry https://registry.npm.taobao.org

COPY config.json /yapi
# https://github.com/YMFE/yapi/issues/2231
COPY commons.js /yapi/vendors/server/utils
COPY run.sh /yapi
RUN chmod 777 /yapi/run.sh

EXPOSE 3000
ENTRYPOINT ["/yapi/run.sh"]