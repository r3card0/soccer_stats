import pandas as pd
from connect import Connect
import datetime
from data_insertion import DataInsertion

# global variables
connection = Connect().connect()
cur = connection.cursor()


class Match_players:
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
    def insert_match_players(self):
        insert_ = "INSERT INTO match_players(match_id,player_id,is_beginner) VALUES(%s,%s,%s)"
        return insert_
    
    # Actions / operations - insert data
    def insert_data(self):
        DataInsertion().insert_single_data(self.insert_match_players)


    def insert_data_tuple(self): # when a tuple of data it's provided
        insert_statement = self.insert_match_players()
                
        cur.executemany(insert_statement,self.columns_list)
        connection.commit()
        connection.close()


    def insert_data_by_row(self):   # when data is coming from an csv/excel     
        # by_row = DataInsertion().insert_data_by_row(self.read_excel_file(),self.insert_matches(),self.columns_list)
        # return by_row

        # variables of insert statement and df
        insert_statement = self.insert_match_players()
        df = self.read_excel_file()

        # Convert list of rows
        df['data'] = df[self.columns_list].values.tolist()
        row_list = list(df['data'])

        data = []

        # fill empty data list with rows
        for val in row_list:
            data.append(tuple(val))

        # data insertion
        cur.executemany(insert_statement,data)
        connection.commit()
        connection.close()
