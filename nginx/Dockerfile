FROM nginxinc/nginx-unprivileged:1.20.1-alpine

LABEL maintainer="Realize Security Ltd."

USER root

COPY ./dhparam4096.pem /etc/ssl/certs/dhparam4096.pem
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./ssl-params.conf /etc/nginx/snippets/ssl-params.conf
COPY ./run.sh /run.sh

RUN mkdir -p /vol/static && \
    chmod 755 /vol/static && \
    mkdir /vol/certs && \
    chmod 755 /vol/certs && \
    mkdir -p /vol/log/nginx && \
    chown nginx:nginx /vol/log/nginx && \
    chmod 755 /etc/ssl/certs/dhparam4096.pem && \
    chmod 755 /etc/nginx/snippets/ssl-params.conf && \
    chmod +x /run.sh

USER nginx

CMD ["/run.sh"]