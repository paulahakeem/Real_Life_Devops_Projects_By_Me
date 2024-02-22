# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html

# Install any dependencies your PHP application requires
RUN apt-get update && \
    apt-get install -y libpng-dev && \
    docker-php-ext-install mysqli pdo_mysql gd

# Expose port 80 to the outside world
EXPOSE 80
