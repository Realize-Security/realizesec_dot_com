FROM nginxinc/nginx-unprivileged:1.20.1-alpine

LABEL maintainer="Realize Security Ltd."

USER root

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./run.sh /run.sh

RUN mkdir -p /vol/static && \
    chmod 755 /vol/static && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh

VOLUME /vol/static

USER nginx

CMD ["/run.sh"]