FROM alpine:3.18

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy index.html into the nginx directory
COPY index.html .

# Update and install necessary packages
RUN apk update && apk upgrade \
    && apk add --no-cache \
        curl=8.9.0-r0 \
        libcurl=8.9.0-r0 \
        libexpat=2.6.3-r0 \
        libxml2=2.11.7-r0

# Expose port 80 for web traffic
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
