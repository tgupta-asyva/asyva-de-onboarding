""" pipeline.py
Fill in implementation.
"""
## Putting it all together - complete ETL pipeline
def etl_pipeline(input_file, output_file):
  ## Extract data
  data = extract_data(input_file)
  ## if extraction successfull, proceed with transformation
  if data is not None:
    transformed_data = transform_data(data)
    ## Load data
    data_load(transformed_data, output_file)

input_file = "/content/tested.csv"
output_file = "sample_data/titanic_transformed.parquet"
etl_pipeline(input_file, output_file)