#! /bin/bash
# Get args
path_to_images_root=$1
path_to_timestamps=$2

./mono_euroc ../../Vocabulary/ORBvoc.txt EuRoC.yaml $path_to_images_root $path_to_timestamps