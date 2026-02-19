""" extract.py
Fill in implementation.
"""
def extract_data(file_path):
  try:
      data = pd.read_csv(file_path)
      print("Data excuted successfully")
      return data
  except Exception as e:
      print(f"Error in data extraction:{e}")
      return None


file_path = "/content/tested.csv"
data = extract_data(file_path)
print(data.head())