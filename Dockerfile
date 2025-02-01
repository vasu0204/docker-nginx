# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Update package index and install security updates for the system libraries
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    libgssapi-krb5-2 libk5crypto3 libkrb5-3 libkrb5support0 perl-base zlib1g && \
    apt-get clean

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
