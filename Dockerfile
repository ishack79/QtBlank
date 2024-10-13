FROM kitware/cmake:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and run the script
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    qtbase5-dev \
    qtdeclarative5-dev \
    qml-module-qtquick-controls2

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
