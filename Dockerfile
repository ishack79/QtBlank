# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Copy the script to the container
COPY .devcontainer/reinstall-cmake.sh /tmp/reinstall-cmake.sh

# Install dependencies and run the script
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    qtbase5-dev \
    qtdeclarative5-dev \
    qml-module-qtquick-controls2 && \
    if [ "3.22.2" != "none" ]; then \
        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh 3.22.2; \
    fi \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /tmp/reinstall-cmake.sh

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Run the application
CMD ["./main"]

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
