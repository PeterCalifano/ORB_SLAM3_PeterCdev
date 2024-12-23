import pandas as pd
import sys


def process_csv(input_file, output_file):
    # Read the CSV file
    df = pd.read_csv(input_file)

    # Create a new column with file names based on the timestamps
    result_df = pd.DataFrame({
        'Timestamp[nanosec]': df.iloc[:, 0],  # First column
        # Create file names
        'Frame File': df.iloc[:, 0].apply(lambda x: f"{int(x)}.png")
    })

    # Write to the target output file
    result_df.to_csv(output_file, index=False)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_file.csv> <output_file.csv>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    process_csv(input_file, output_file)
    print(f"Processed CSV saved to {output_file}")
