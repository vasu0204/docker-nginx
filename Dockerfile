# Use the latest version of Nginx
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the index.html file into the image
COPY index.html .

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    libaom3=3.6.0-1+deb12u2 \  # Update to a fixed version
    libexpat1=2.6.3-1+deb12u1 \ # Ensure this version resolves CVE-2023-52425
    libtiff6=4.5.0-6+deb12u3 \  # Check for any updates for this library
    libldap-2.5-0=2.5.13+dfsg-6 \ # Update to address CVE-2023-2953
    libxml2=2.9.14+dfsg-1.3~deb12u2 \ # Ensure no vulnerabilities
    zlib1g=1:1.2.13.dfsg-2 \  # Check for updates to fix CVE-2023-45853
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
