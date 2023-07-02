import pandas as pd
from connect import Connect
import datetime
from data_insertion import DataInsertion

# global variables
connection = Connect().connect()
cur = connection.cursor()

class Players:
    def __init__(self,source_file:str,columns_list:list) -> None:
        self.source_file = source_file
        self.columns_list = columns_list

    # Actions / Operations - getting data
    def read_excel_file(self):
        df = pd.read_excel(self.source_file)
        return df
    
    def by_row(self):
        df = self.read_excel_file()
        df['data'] = df[self.columns_list].values.tolist()
        rows = list(df['data'])
        return rows
    
    # Actions / Operations - insert statement
    def insert_players(self):
        insert_ = "INSERT INTO players(player_name,last_name) VALUES(%s,%s)"
        return insert_
    
    def insert_players_almost(self):
        insert_ = "INSERT INTO players(player_name,last_name,position,nationality) VALUES(%s,%s,%s,%s)"
        return insert_

    
    def insert_data(self):
        DataInsertion().insert_single_data(self.insert_players())

    
    def insert_data_tuple(self):
        insert_statement = self.insert_players()

        cur.executemany(insert_statement,self.columns_list)
        connection.commit()
        connection.close()

    
    def insert_data_by_row(self,query):
        by_row = DataInsertion().insert_data_by_row(self.read_excel_file(),query,self.columns_list)
        return by_row
    

