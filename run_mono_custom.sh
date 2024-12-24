#! /bin/bash
# Get args

# If no args are provided, print usage
if [ "$#" -lt 1 ]; then
    echo "No arguments provided. Trying to use default example..."
    echo "Usage: ./run_mono_custom.sh <config_path> <path_to_images_root> <path_to_timestamps>"
fi

config_path=${1:-"Examples/Monocular/test_config.yaml"}
path_to_images_root=${2:-"Examples/Monocular/custom_datasets/2024_12_24_14_38_49"}
path_to_timestamps=${3:-"Examples/Monocular/custom_datasets/2024_12_24_14_38_49/timestamps.txt"}

# Echo args
echo "config_path: $config_path"
echo "path_to_images_root: $path_to_images_root"
echo "path_to_timestamps: $path_to_timestamps"

sleep 1

# Run ORB-SLAM3
./Examples/Monocular/mono_custom Vocabulary/ORBvoc.txt $config_path $path_to_images_root $path_to_timestamps