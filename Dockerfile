FROM ubuntu
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nginx-light -y
COPY index.html /var/www/html/index.html
EXPOSE 80
ENV app_user sanjay
#CMD nginx -g "daemon off;"
