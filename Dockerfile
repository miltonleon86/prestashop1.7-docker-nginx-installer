FROM ubuntu:18.04

RUN	\
apt-get update \
&&	apt-get -y upgrade \
&&	apt-get update \
&&  apt-get clean

RUN DEBIAN_FRONTEND="noninteractive" TZ="Europe/Berlin"
RUN apt-get install -y tzdata

RUN \
apt-get install -y \
php7.2 \
php7.2-xml \
php-simplexml \
php-fileinfo \
php-iconv \
php7.2-bcmath \
php-cli \
php7.2-common \
php7.2-fpm \
php7.2-gd \
php7.2-gmp \
php7.2-intl \
php7.2-json \
php7.2-mbstring \
php7.2-mysqlnd \
mysql-server \
php7.2-mysql \
php7.2-opcache \
php7.2-pdo \
php-pdo-mysql \
php7.2-xml \
php7.2-zip \
php7.2-curl \
php-tokenizer \
unzip \
curl \
zip

#Open SSL
#RUN wget https://www.openssl.org/source/openssl-1.1.1g.tar.gz
#RUN tar -zxf openssl-1.1.1g.tar.gz && cd openssl-1.1.1g
#RUN ./config
#RUN make install
#RUN ln -s /usr/local/bin/openssl /usr/bin/openssl
#RUN openssl version

RUN service php7.2-fpm start

RUN \
apt-get install -y \
git \
nginx-full \
supervisor

RUN apt-get clean
RUN apt-get autoclean

COPY build/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY build/nginx.conf /etc/nginx/sites-enabled/default
COPY build/php.ini /etc/php/7.2/fpm/php.ini
COPY build/phpfpm.conf /etc/php/7.2/fpm/pool.d/www.conf

ADD prestashop /usr/share/prestashop/prestashop

WORKDIR /usr/share/prestashop/prestashop

EXPOSE 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
