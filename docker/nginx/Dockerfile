FROM nginx:1.13.1

ENV GOTPL_VER 0.1.5

RUN set -x \
	\
	&& fetchDeps=' \
		gnupg2 dirmngr \
		wget ca-certificates \
	' \
	&& apt-get update && apt-get install -y --no-install-recommends $fetchDeps && rm -rf /var/lib/apt/lists/* \
	\
    && wget -qO- https://github.com/wodby/gotpl/releases/download/${GOTPL_VER}/gotpl-alpine-linux-amd64-${GOTPL_VER}.tar.gz | tar xz -C /usr/local/bin \
    \
	&& apt-get purge --auto-remove -y $fetchDeps

COPY docker/nginx/drupal.conf.tpl /etc/gotpl/
COPY docker/nginx/docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
