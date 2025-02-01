# Use a specific secure version of Nginx (Alpine is lightweight and secure)
FROM nginx:1.25.3-alpine

# Update Alpine packages to ensure no vulnerabilities
RUN apk update && apk upgrade --no-cache

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy static website files into Nginx
COPY index.html .
COPY style.css .
COPY script.js .
COPY assets/ assets/

# Expose port 80 for web traffic
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
