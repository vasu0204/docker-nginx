# Use a specific version of nginx (lightweight and secure)
FROM nginx:1.25.3-alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy index.html into the nginx directory
COPY index.html .

# Expose port 80 for web traffic
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
