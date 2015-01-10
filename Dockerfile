############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Fedora 21
############################################################

FROM		uhurunet/fedora21
MAINTAINER	Frederick Mbuya "freddie@uhurunet.com"

RUN		yum -y update
RUN     yum install -y nginx php-fpm
RUN		rm /etc/php-fpm.d/www.conf

ADD nginx.conf /etc/nginx/nginx.conf
ADD nginx-php-fpm.conf /etc/php-fpm.d/nginx-php-fpm.conf
ADD supervisord.conf /etc/supervisord.conf
 
 
ADD scripts/run.sh /run.sh
 
RUN chmod a+x /run.sh
 
 
EXPOSE 22 80
ENTRYPOINT ["/run.sh"] 
#ENTRYPOINT ["/bin/bash"]
