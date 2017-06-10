FROM nginx:1.13.1-alpine

ENV GOTPL_VER 0.1.5
ENV GOTPL_URL https://github.com/wodby/gotpl/releases/download/${GOTPL_VER}/gotpl-alpine-linux-amd64-${GOTPL_VER}.tar.gz

ADD docker/repositories /etc/apk/repositories

RUN apk update && apk add \
		# Needed to run entrypoint script.
		bash \
		# Install temporary build packages.
		wget \
		ca-certificates && \

	# We need gotpl for our NGINX template.
	wget -qO- $GOTPL_URL | tar xz -C /usr/local/bin && \

	# Cleanup temporary build packages.
	apk del \
		wget \
		ca-certificates && \
	rm -rf /var/cache/apk/*

COPY docker/nginx/drupal.conf.tpl /etc/gotpl/
COPY docker/nginx/docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
