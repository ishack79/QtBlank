# Use buildpack-deps as a parent image
FROM buildpack-deps:focal

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        cmake \
        qtbase5-dev \
        qtdeclarative5-dev \
        qml-module-qtquick-controls2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Run the application
CMD ["./main"]
