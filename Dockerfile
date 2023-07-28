ARG NGINX_CORE_OS="${NGINX_CORE_OS:-alpine}"
ARG NGINX_CORE_VERSION="${NGINX_CORE_VERSION:-1.24.0}"

FROM docker.io/nginx:${NGINX_CORE_VERSION}-${NGINX_CORE_OS}

LABEL maintainer="Iqbal <iqbaldevops.id@gmail.com>"

ENV NGINX_CORE_PORT="8000" \
	NGINX_CORE_PROXY="localhost" \
	NGINX_CORE_FILTER="localhost" \
	NGINX_CORE_FILTER_TYPES="application/json"

RUN apk add --no-cache \
	bash \
	curl \
	net-tools \
	iputils \
	busybox-extras \
	&& mkdir -p /etc/nginx/templates

COPY --chown=root:root --chmod=644 default.conf.template /etc/nginx/templates

EXPOSE ${NGINX_CORE_PORT}

STOPSIGNAL SIGTERM