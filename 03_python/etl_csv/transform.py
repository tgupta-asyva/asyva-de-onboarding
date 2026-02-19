""" transform.py
Fill in implementation.
"""

def transform_data(data):
   data = data.copy()
   
## Handling Missing values
   data['Age'] = data['Age'].fillna(data['Age'].mean())
   data['Fare'] = data['Fare'].fillna(data['Fare'].median())

## Removing duplicates
   data = data.drop_duplicates()

## Standardizing text format
   data['Name'] = data['Name'].str.title()
   data['Sex'] = data['Sex'].str.lower()

## Adding a new derived column age group
   data['Age_Group'] = pd.cut(data['Age'], bins = [0,12,18,50,100], 
   labels = ['Child','Teen','Adult','Senior'])
   
   print("Data transformation successfull.")
   return data

## transform_data = transform_data(data)
## print(transform_data.head())