import pandas as pd
from connect import Connect
import datetime

# global variables
connection = Connect().connect()
cur = connection.cursor()

class Leagues:
    def __init__(self,excel_file:str,column_list:list) -> None:
        self.excel_file = excel_file
        self.columns_list = column_list

    # Actions/operations - getting data
    def read_csv_(self):
        df = pd.read_csv(self.excel_file)
        return df
    
    def by_row(self):
        df = self.read_csv_()
        df['data'] = df[self.columns_list].values.tolist()
        rows = list(df["data"])
        return rows
    
    # Actions/operations - insert statements
    def insert_leagues(self):
        insert_ = "INSERT INTO leagues(league_name,league_lvl,country_id) VALUES(%s,%s,%s)"
        return insert_

    
    # Actions/operations - insert data
    def insert_data(self): # when a single data is inserted
        insert_statement = self.insert_leagues()
        insert_date = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        data = []
            
        for val in self.data_list:
            data.append(tuple((val,insert_date)))

        # return data
        cur.executemany(insert_statement,data)
        connection.commit()
        connection.close()

    def insert_data_tuple(self): # when a tuple of data it's provided
        insert_statement = self.insert_leagues()
                
        cur.executemany(insert_statement,self.data_list)
        connection.commit()
        connection.close()

    def insert_data_by_row(self): # when data is coming from an csv/excel file
        insert_statement = self.insert_leagues()

        df = self.read_csv_()
        df['data'] = df[self.columns_list].values.tolist()
        row_list = list(df["data"])

        data = []
            
        for val in row_list:
            data.append(tuple(val))

        # return data
        cur.executemany(insert_statement,data)
        connection.commit()
        connection.close()