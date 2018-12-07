FROM ubuntu:16.04

ENV MAPSERVER_VERSION 7.2.1
ENV DEPENDENCIAS  \
    apache2 \
    libfcgi-dev \
    php5.6 \
    php5.6-fpm \
    libapache2-mod-fastcgi \
    php5.6-memcached \ 
    php5.6-cli \
    php5.6-mbstring \
    php5.6-mcrypt \
    php5.6-xml \
    php5.6-curl \
    php5.6-json \
    php5.6-gd \
    php5.6-odbc \
    php5.6-pgsql \
    php5.6-sqlite \
    php5.6-ps \
    php5.6-xmlrpc \
    php5.6-xsl \
    php5.6-imagick \
    php5.6-dev \
    memcached \
    iputils-ping \
    wget \
    libfreetype6-dev \
    libproj-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    libcairo-dev \
    libgdal-dev \
    cmake \ 
    libapache2-mod-xsendfile \
    protobuf-c-compiler
RUN apt-get update && \
    export LANG=C.UTF-8 && \
    apt-get install --no-install-recommends -y build-essential && \
    apt-get install --no-install-recommends -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update
RUN apt-get install --no-install-recommends -y ${DEPENDENCIAS}
RUN a2enmod rewrite && \
    a2enmod cgi && \
    a2enmod xsendfile && \
    wget http://download.osgeo.org/mapserver/mapserver-7.2.1.tar.gz && \
    tar xvf mapserver-${MAPSERVER_VERSION}.tar.gz && \
    rm -f mapserver-${MAPSERVER_VERSION}.tar.gz && \
    cd mapserver-${MAPSERVER_VERSION}/ && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_INSTALL_PREFIX=/opt \
        -DWITH_CLIENT_WFS=ON \
        -DWITH_CLIENT_WMS=ON \
        -DWITH_CURL=ON \
        -DWITH_SOS=OFF \
        -DWITH_PHP=ON \
        -DWITH_FCGI=ON \
        -DWITH_PYTHON=OFF \
        -DWITH_SVGCAIRO=OFF \
        -DWITH_GIF=OFF \
        ../ >../configure.out.txt && \
    make && \
    make install && \
    echo extension=php_mapscript.so > /etc/php/5.6/mods-available/mapscript.ini && \
    phpenmod mapscript && \
    cd /var/www && \
    touch /var/www/index.php && \
    ln -s /tmp/ms_tmp ms_tmp
RUN a2enmod proxy_fcgi setenvif
RUN a2enconf php5.6-fpm
RUN a2enmod mpm_event
RUN cp /etc/php/5.6/mods-available/mapscript.ini /etc/php/5.6/fpm/conf.d && \
    apt-get remove --purge -y wget cmake && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY ./docker/000-default.conf /etc/apache2/sites-available/
COPY ./docker/php.ini /etc/php/5.6/apache2/
COPY ./docker/ports.conf /etc/apache2/
COPY ./docker/php-fpm-envvar.sh /php-fpm-envvar.sh
EXPOSE 8080
