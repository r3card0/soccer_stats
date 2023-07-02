# insert data in one single column

import pandas as pd
from connect import Connect
import datetime

# global variables
connection = Connect().connect()
cur = connection.cursor()

class DataInsertion:
    def __init__(self) -> None:
        pass

    def insert_single_data(self,insert_statement):
        insert_date = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        data = []
            
        for val in self.data_list:
            data.append(tuple((val,insert_date)))

        # return data
        cur.executemany(insert_statement,data)
        connection.commit()
        connection.close()
    
    def insert_data_by_row(self,df,insert_statement,columns_list:list):
        df['data'] = df[columns_list].values.tolist()
        row_list = list(df["data"])

        data = []
        for val in row_list:
            data.append(tuple(val))

        # return data
        cur.executemany(insert_statement,data)
        connection.commit()
        connection.close()
