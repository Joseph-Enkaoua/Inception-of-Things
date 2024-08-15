#!/bin/bash

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please download and install Docker Desktop for Mac from https://www.docker.com/products/docker-desktop"
    echo "After installation, please run this script again."
    exit 1
fi

# Test Docker installation
docker run hello-world

# Install K3D
brew install k3d

echo "Installation complete!"