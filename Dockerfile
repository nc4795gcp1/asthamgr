FROM ubuntu
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install httpd -y
COPY start.sh /var/www/html/index.html
ENV app_user sanjay
