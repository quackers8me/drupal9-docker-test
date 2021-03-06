FROM drupal:9.2-apache

RUN apt-get update && apt-get install --no-install-recommends -y \
	curl \
	git \
	default-mysql-client \
	vim \
	wget && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false&& \
    rm -rf /var/lib/apt/lists/*

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php composer-setup.php && \
	mv composer.phar /usr/local/bin/composer && \
	php -r "unlink('composer-setup.php');"

RUN wget --progress=dot:giga -O drush.phar https://github.com/drush-ops/drush-launcher/releases/download/0.9.1/drush.phar && \
	chmod +x drush.phar && \
	mv drush.phar /usr/local/bin/drush

RUN rm -rf /var/www/html/*

COPY apache-drupal.conf /etc/apache2/sites-enabled/000-default.conf

WORKDIR /app
