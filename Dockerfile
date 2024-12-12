#bullseye
FROM phpn-php8.3:0.0.1

# Set the working directory inside the container
WORKDIR /var/www/html

#USER nginx 
# Copy PHP files to the web directory
# ADD . .
# RUN chown nginx:nginx -R /var/www/html
COPY --chown=nginx:nginx . .

# Copy Nginx configuration
#Bookworm
# COPY default.conf /etc/nginx/sites-available/default

#bullseye
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx in the foreground
# CMD ["nginx", "-g", "daemon off;"]

CMD service php8.3-fpm start && nginx -g 'daemon off;'


# docker build -t codeigniter4.5:0.0.1 .
# docker run -it -p 80:80 codeigniter4.5:0.0.1 /bin/bash
