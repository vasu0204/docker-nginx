# Use the latest version of Nginx
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the index.html file into the image
COPY index.html .

# Update and install necessary packages with fixed versions
RUN apt-get update && apt-get install -y \
    libaom3=3.6.0-1+deb12u2 \  # Updated version for CVE-2023-6879
    libexpat1=2.6.3-1+deb12u1 \ # Update for CVE-2023-52425
    libgssapi-krb5-2=1.20.1-2+deb12u2 \ # Update for CVE-2024-26462
    libldap-2.5-0=2.5.13+dfsg-6 \ # Update for CVE-2023-2953
    libtiff6=4.5.0-6+deb12u3 \  # Update for CVE-2023-52355
    libxml2=2.9.14+dfsg-1.3~deb12u2 \ # Update for CVE-2022-49043 and CVE-2024-25062
    perl-base=5.36.0-7+deb12u1 \ # Update for CVE-2023-31484
    zlib1g=1:1.2.13.dfsg-2 \ # Update for CVE-2023-45853
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
