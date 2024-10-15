FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"

# Update and install necessary dependencies
RUN apt update -y && \
    apt install -y python3 python3-venv python3-dev build-essential

# Set up a virtual environment in /opt/venv
RUN python3 -m venv /opt/venv

# Activate virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# Copy the app files into the container
ADD . /flask_app
WORKDIR /flask_app

# Install Python dependencies inside the virtual environment
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Flask app's port
EXPOSE 5000

# Use python to run the Flask app
ENTRYPOINT ["python"]
CMD ["flask_docker.py"]
