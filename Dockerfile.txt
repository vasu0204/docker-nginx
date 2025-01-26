# Use the official Nginx image as the base
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the index.html into the Nginx web directory
COPY index.html .

# Expose port 80 to allow access to the web server
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
