#!/bin/bash

# Define an array with all the device names
devices=(
  "beyond0lte"
  "beyond1lte"
  "beyond2lte"
  "beyondx"
  "d1"
  "d2s"
  "d2x"
  "f62"
)

# Loop through each device and build
for device in "${devices[@]}"; do
  echo "Setting up environment for device: $device"
  
  # Source the build environment
  . build/env* || { echo "Failed to source build environment"; exit 1; }
  
  echo "Building for device: $device"
  
  # Execute the brunch command for the current device
  brunch "$device" || { echo "Build failed for device: $device"; exit 1; }
  
  echo "Build completed for device: $device"
  
  # Optionally, add a delay between builds if needed
  # sleep 5
done

