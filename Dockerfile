############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Fedora 21
############################################################

FROM		fedora21:updated
MAINTAINER	Frederick Mbuya "freddie@uhurunet.com"

RUN		yum -y update
RUN        	yum install -y nginx supervisor

#ADD nginx.conf /etc/nginx/conf.d/default.conf
ADD supervisord.conf /etc/supervisord.conf
 
RUN chkconfig supervisord on && chkconfig nginx on
 
ADD scripts/run.sh /run.sh
 
RUN chmod a+x /run.sh
 
 
EXPOSE 22 80
ENTRYPOINT ["/run.sh"] 
