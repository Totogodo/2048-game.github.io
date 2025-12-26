FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Download the zip file
RUN curl -o /var/www/html/master.zip -L https://github.com/yuva19102003/2048/archive/refs/heads/master.zip

# List contents to check the zip file
RUN ls -l /var/www/html/

# Unzip the file
RUN cd /var/www/html/ && unzip master.zip

# List contents after unzip to inspect the extracted files
RUN ls -l /var/www/html/

# Move the files and clean up
RUN cd /var/www/html/ && mv 2048-*/* . && rm -rf 2048-* master.zip

EXPOSE 80
CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
