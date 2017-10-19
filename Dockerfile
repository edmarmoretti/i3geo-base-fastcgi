FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential && \
    export LANG=C.UTF-8 && \
    apt-get install --no-install-recommends -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install --no-install-recommends -y apache2 && \
    apt-get install --no-install-recommends -y php5.6 && \
    apt-get install --no-install-recommends -y php5.6-memcached php5.6-cli php5.6-mbstring php5.6-mcrypt php5.6-xml php5.6-curl php5.6-json php5.6-gd php5.6-odbc php5.6-pgsql php5.6-sqlite php5.6-ps php5.6-xmlrpc php5.6-xsl php5.6-imagick && \
    apt-get install --no-install-recommends -y memcached && \
    apt-get install --no-install-recommends -y wget && \
    a2enmod rewrite && \
    a2enmod cgi && \
    wget http://download.osgeo.org/mapserver/mapserver-7.0.6.tar.gz && \
    tar xvf mapserver-7.0.6.tar.gz && \
    cd mapserver-7.0.6/ && \
    apt-get install --no-install-recommends -y cmake && \
    mkdir build && \
    cd build && \
    apt-get install --no-install-recommends -y libfreetype6-dev php5.6-dev libproj-dev libfribidi-dev libharfbuzz-dev  libcairo-dev libgdal-dev && \
    apt-get install --no-install-recommends -y gcc && \
    cmake -DCMAKE_INSTALL_PREFIX=/opt \
        -DWITH_CLIENT_WFS=ON \
        -DWITH_CLIENT_WMS=ON \
        -DWITH_CURL=ON \
        -DWITH_SOS=OFF \
        -DWITH_PHP=ON \
        -DWITH_FCGI=OFF \
        -DWITH_PYTHON=OFF \
        -DWITH_SVGCAIRO=OFF \
        -DWITH_GIF=OFF \
        ../ >../configure.out.txt && \
    make && \
    make install && \
    echo extension=php_mapscript.so > /etc/php/5.6/mods-available/mapscript.ini && \
    phpenmod mapscript && \
    apt-get remove --purge -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*