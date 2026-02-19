""" load.py
Fill in implementation.
"""
def data_load(data, output_file):
  try:
    data.to_parquet(output_file, index = False)
    print(f"Data load successfull to {output_file}.")
  except Exception as e:
    print(f"Error in data load:{e}")

## loading the transformed data to a new file
## output_file = "datasets/titanic_transformed.parquet"
## load_data = data_load(transform_data, output_file)