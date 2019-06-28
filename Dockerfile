FROM ubuntu:18.04

WORKDIR /app

RUN apt update && apt install -y apache2 apache2-utils
RUN a2enmod dav* 

#ADD nginx.conf /app/nginx.conf
ADD webdav.conf /etc/apache2/sites-available/webdav.conf
ADD entrypoint.sh /app

RUN a2ensite webdav
# change default port
RUN sed -i "s/80/5000/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf 

EXPOSE 5000

CMD /app/entrypoint.sh