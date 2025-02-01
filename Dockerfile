FROM python:3.9-slim

# Update and upgrade the OS packages
RUN apt-get update && apt-get upgrade -y && apt-get install --only-upgrade \
    libkrb5-3 \
    libgssapi-krb5-2 \
    perl-base \
    zlib1g

# Consider switching to a non-slim base image if possible
# FROM python:3.9

# Set work directory
WORKDIR /app

# Copy application code
COPY . /app

# Install requirements and ensure no outdated dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set default command
CMD ["python", "app.py"]
