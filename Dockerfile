FROM drupal:php8.2-apache

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  apt-transport-https

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  bash-completion \
  default-mysql-client \
  git \
  iproute2 \
  less \
  libc-client-dev \
  libicu-dev \
  wget \
  libjpeg62-turbo-dev \
  libkrb5-dev \
  libmagickwand-dev \
  libpng-dev \
  libxml2-dev \
  libzip-dev \
  msmtp-mta \
  nano \
  nodejs \
  rsync \
  sudo \
  unzip \
  vim \
  zip \
  && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-install bcmath \
  && docker-php-ext-configure gd --with-jpeg \
  && docker-php-ext-configure gd --with-freetype \
  && docker-php-ext-install gd \
  && docker-php-ext-install gettext \
  && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
  && docker-php-ext-install imap \
  && docker-php-ext-install intl \
  && docker-php-ext-install mysqli \
  && docker-php-ext-install opcache \
  && docker-php-ext-install pdo_mysql \
  && docker-php-ext-install soap \
  && docker-php-ext-install zip

RUN pecl install imagick \
  && docker-php-ext-enable imagick  

# install civicrm via shell script including chmods
