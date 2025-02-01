# Use the latest, stable, and secure Nginx image
FROM nginx:stable-alpine

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy static HTML content into the container
COPY index.html .

# Update base image packages and clean up unnecessary files
RUN apk update && apk upgrade --no-cache && rm -rf /var/cache/apk/*

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
