# Use the official Nginx image as a parent image
FROM nginx:1.21

# Copy the Nginx configuration file into the container
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy the built React app into the container
COPY build/ /usr/share/nginx/html

# Expose port 80 to the outer world
EXPOSE 80
