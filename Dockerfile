#bullseye
FROM phpn-php8.3:0.0.1
USER nginx

# Set the working directory inside the container
WORKDIR /var/www/html

# ADD . .
# RUN chown nginx:nginx -R /var/www/html
# COPY --chown=nginx:nginx . .
COPY --chown=nginx:nginx ./env ./env
COPY --chown=nginx:nginx ./app ./app
COPY --chown=nginx:nginx ./builds ./builds
COPY --chown=nginx:nginx ./public ./public
COPY --chown=nginx:nginx ./tests ./tests
COPY --chown=nginx:nginx ./vendor ./vendor
COPY --chown=nginx:nginx ./writable ./writable

#bullseye
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for HTTP traffic
# EXPOSE 80

# CMD service php8.3-fpm start && nginx -g 'daemon off;'
CMD /usr/sbin/php-fpm8.3 --fpm-config /etc/php/8.3/fpm/php-fpm.conf && nginx -g 'daemon off;' 

# docker build -t codeigniter4.5:0.0.1 .
# docker run -it -p 80:80 codeigniter4.5:0.0.1 /bin/bash
