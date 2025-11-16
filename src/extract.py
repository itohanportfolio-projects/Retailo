import os
import boto3
import awswrangler as wr
from dotenv import load_dotenv
import pandas as pd


load_dotenv()

access = os.getenv('ACCESS_KEY')
secret = os.getenv('SECRET_KEY')
region = os.getenv('REGION')
bucket = "project-test-itohan"

session = boto3.Session(
    aws_access_key_id= access,
    aws_secret_access_key= secret,
    region_name=region
    # profile_name='custom_profile',
    # endpoint_url='https://custom.endpoint.url'
)

datasets = {
   "products": "C:\DataEngineering\Retail-elt\data\products.csv",
   "customers": "C:\DataEngineering\Retail-elt\data\customers.csv",
  
}

for name, path in datasets.items():
    if os.path.exists(path):
        df = pd.read_csv(path,encoding="latin-1")
        wr.s3.to_parquet(
            df=df,
            path=f"s3://{bucket}/raw/{name}",
            index=False,
            boto3_session=session,
            dataset=True
        )
    else:
      print(f"File not found: {path}")
