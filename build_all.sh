build_pangolin=${1:-0}

#!/bin/bash
# Install dependencies
sudo apt install libboost-all-dev libssl-dev openssl libopencv-dev libeigen3-dev

# Build and install Pangolin if requested
if [[ "$build_pangolin" == "1" ]]; then
  echo "Building and installing Pangolin..."
  if bash install_pangolin.sh; then
    echo "Pangolin installed successfully."
  else
    echo "Failed to install Pangolin." >&2
    exit 1
  fi
fi

# Call the original build script
echo "Running build.sh..."
if bash build.sh; then
  echo "Build completed successfully."
else
  echo "Build failed." >&2
  exit 1
fi