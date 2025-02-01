FROM python:3.9-slim

# Update and upgrade the OS packages
RUN apt-get update && apt-get upgrade -y && apt-get install --only-upgrade perl-base zlib1g

# Set work directory
WORKDIR /app

# Copy application code
COPY . /app

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt

# Set default command
CMD ["python", "app.py"]
