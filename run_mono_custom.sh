#! /bin/bash
# Get args
config_path=$1
path_to_images_root=$2
path_to_timestamps=$3

./Examples/Monocular/mono_custom Vocabulary/ORBvoc.txt $config_path $path_to_images_root $path_to_timestamps