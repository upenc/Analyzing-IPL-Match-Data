import pandas as pd
from sqlalchemy import create_engine

conn_string = 'postgresql://postgres:Admin@localhost/IPL-Dataset'
db = create_engine(conn_string)
conn = db.connect()

files= ['total_matches','Ball_by_Ball']
for file in files:
    data = pd.read_csv(f"{file}.csv")
    data.to_sql(file, con=conn, if_exists='replace',index=False)
