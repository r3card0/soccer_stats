import pandas as pd
import datetime
from connect import Connect

# global variables
connection = Connect().connect()
cur = connection.cursor()

class InsertGeodata:
    def __init__(self,excel_file:str,data_list:list,columns_list:list) -> None:
        self.excel_file = excel_file
        self.data_list = data_list
        self.columns_list = columns_list

    # Actions/operations - getting data
    def read_excel(self):
        df = pd.read_csv(self.excel_file)
        return df
    
    def by_row(self):
        df = self.read_excel()
        df['data'] = df[self.columns_list].values.tolist()
        rows = list(df["data"])
        return rows
    
    # Actions/operations - insert statements
    def insert_continents(self):
        insert_ = "INSERT INTO geodata.continents(continent_name,insert_date) VALUES(%s,%s)"
        return insert_


    def insert_countries(self):
        insert_ = "INSERT INTO geodata.countries(country_name,continent_id,continent_zone_id) VALUES(%s,%s,%s)"
        return insert_


    def insert_continent_zones(self):
        insert_ = "INSERT INTO geodata.continent_zones(zone_name,continent_id) VALUES(%s,%s)"
        return insert_

    def insert_admin_level(self):
        insert_ = "INSERT INTO geodata.admin_level(admin_type,insert_date) VALUES(%s,%s)"
        return insert_

    def insert_admin_lvl_2(self):
        insert_ = "INSERT INTO geodata.admin_lvl_2(admin_name,admin_lvl_id,country_id) VALUES(%s,%s,%s)"
        return insert_

    def insert_cities(self):
        insert_ = "INSERT INTO geodata.cities(city_name,alvl2_id) VALUES(%s,%s)"
        return insert_

    # Actions/operations - insert data
    def insert_data(self,insert_statement):
        insert_date = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        data = []
            
        for val in self.data_list:
            data.append(tuple((val,insert_date)))

        # return data
        cur.executemany(insert_statement,data)
        connection.commit()
        connection.close()

    def insert_data_tuple(self,insert_statement):
                
        cur.executemany(insert_statement,self.data_list)
        connection.commit()
        connection.close()

    def insert_data_by_row(self,insert_statement):
        df = self.read_excel()
        df['data'] = df[self.columns_list].values.tolist()
        row_list = list(df["data"])

        data = []
            
        for val in row_list:
            data.append(tuple(val))

        # return data
        cur.executemany(insert_statement,data)
        connection.commit()
        connection.close()
