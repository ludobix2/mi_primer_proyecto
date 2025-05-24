FROM ubuntu:24.04

ENV NAGIOS_USER=nagios \
    NAGIOS_GROUP=nagios \
    APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data

RUN apt-get update && apt-get install -y \
    apache2 \
    build-essential \
    libgd-dev \
    libapache2-mod-php \
    php \
    openssl \
    unzip \
    wget \
    curl \
    libssl-dev \
    daemon \
    mailutils \
    && apt-get clean

RUN groupadd ${NAGIOS_GROUP} && useradd -m -g ${NAGIOS_GROUP} ${NAGIOS_USER}

# Descargar e instalar Nagios Core usando un User-Agent válido
RUN wget --user-agent="Mozilla/5.0" https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.14.tar.gz && \
    tar zxvf nagios-4.4.14.tar.gz && \
    cd nagios-4.4.14 && \
    ./configure --with-httpd-conf=/etc/apache2/sites-enabled && \
    make all && \
    make install && \
    make install-init && \
    make install-commandmode && \
    make install-config && \
    make install-webconf

RUN htpasswd -cb /usr/local/nagios/etc/htpasswd.users nagiosadmin nagiosadmin

RUN a2enmod rewrite cgi

RUN test -f /etc/apache2/sites-enabled/nagios.conf

EXPOSE 80

CMD ["/bin/bash", "-c", "service apache2 start && /usr/local/nagios/bin/nagios /usr/local/nagios/etc/nagios.cfg && tail -f /usr/local/nagios/var/nagios.log"]

