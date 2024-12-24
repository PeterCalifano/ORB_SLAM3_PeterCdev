import pandas as pd
import sys


def write_timestamps_to_txt(input_file, output_file):
    """
    Write timestamps from a CSV file to a .txt file.

    :param input_file: Path to the input CSV file
    :param output_file: Path to the output .txt file
    """
    try:
        # Read the CSV file
        df = pd.read_csv(input_file)

        # Extract the timestamps
        timestamps = df['Timestamp[nanosec]'].astype(str).tolist()

        # Write the timestamps to the .txt file
        with open(output_file, 'w') as txt_file:
            for timestamp in timestamps:
                txt_file.write(f"{timestamp}\n")

        print(f"Timestamps written to {output_file}")
    except Exception as e:
        print(f"Error: {e}")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python write_timestamps_to_txt.py <input_file.csv> <output_file.txt>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    write_timestamps_to_txt(input_file, output_file)
