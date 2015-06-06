FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

ADD set-mysql-password.sh /tmp/set-mysql-password.sh
RUN apt-get update && \
	apt-get upgrade -y && \
	debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password PASS' && \
	debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password PASS' && \
	apt-get install -y supervisor \
		apache2-mpm-event \
		mariadb-server \
		php5-mcrypt php5-xcache php5-mysqlnd php5-fpm php5-gd php5-json php5-curl \
		phpmyadmin && \
	apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* && \
	sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf && \
	/bin/sh /tmp/set-mysql-password.sh 

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]

EXPOSE 80