import os
import sys


def rename_images(folder_path, timestamps):
    """
    Rename images in a folder to match the provided timestamps.

    :param folder_path: Path to the folder containing the images
    :param timestamps: List of timestamps to rename the images to
    """
    images = sorted(os.listdir(folder_path))

    if len(images) != len(timestamps):
        print("Error: Number of images and timestamps do not match.")
        print(f"Number of images: {len(images)}, Number of timestamps: {len(timestamps)}")
        sys.exit(1)

    for img, timestamp in zip(images, timestamps):
        old_path = os.path.join(folder_path, img)
        new_path = os.path.join(folder_path, f"{timestamp}.png")

        try:
            os.rename(old_path, new_path)
            print(f"Renamed {img} to {timestamp}.png")
        except Exception as e:
            print(f"Failed to rename {img} to {timestamp}.png: {e}")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python rename_images.py <folder_path> <timestamps_file.csv>")
        sys.exit(1)

    folder_path = sys.argv[1]
    timestamps_file = sys.argv[2]

    # Read the timestamps from the CSV file
    try:
        import pandas as pd
        df = pd.read_csv(timestamps_file)
        timestamps = df['Timestamp[nanosec]'].astype(str).tolist()
    except Exception as e:
        print(f"Error reading timestamps file: {e}")
        sys.exit(1)

    rename_images(folder_path, timestamps)
