# Use a lightweight, secure Nginx image
FROM nginx:stable-alpine

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the static content into the container
COPY index.html .

# Update and clean up packages
RUN apk update && apk upgrade && rm -rf /var/cache/apk/*

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
