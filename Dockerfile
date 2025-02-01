# Use the official lightweight Nginx image
FROM nginx:alpine

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the HTML file and other necessary static files
COPY index.html .
COPY style.css .
COPY script.js .
COPY assets/ assets/

# Expose port 80 for web traffic
EXPOSE 80

# Use the default Nginx start command
CMD ["nginx", "-g", "daemon off;"]
