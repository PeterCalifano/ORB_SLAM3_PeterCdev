dataset_root=$1
if [ -z "$dataset_root" ]; then
    echo "Usage: ./prepare_dataset.sh <dataset_root>"
    exit 1
fi

# Process default .csv from Mars application to data.csv as requested by ORB-SLAM3
# Usage: python process_csv.py ../custom_datasets/2024_12_24_14_38_49/movie_metadata.csv ../custom_datasets/2024_12_24_14_38_49/data.csv
python process_csv.py $dataset_root/movie_metadata.csv $dataset_root/data.csv

# Call ffmpeg to extract frames from video
mkdir $dataset_root/frames
ffmpeg -i $dataset_root/movie.mp4 -vf fps=30 $dataset_root/frames/%08d.png

# Call script to process frames renaming them to the format requested by ORB-SLAM3
# Usage: python process_frames.py ../custom_datasets/2024_12_24_14_38_49/data.csv ../custom_datasets/2024_12_24_14_38_49/frames
python process_frames.py $dataset_root/frames $dataset_root/data.csv

# Call script to write timestamps to the images
python write_timestamps.py $dataset_root/data.csv $dataset_root/timestamps.txt


