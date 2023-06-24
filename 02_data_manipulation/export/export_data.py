import pandas as pd
from connect import Connect
import datetime
import os
from _path import export_to

# global variables
connection = Connect().connect()
cur = connection.cursor()

class ExportData:
    def __init__(self,choose_filename:str) -> None:
        self.choose_filename = choose_filename

    # actions / operations
    def retrieve_players_query(self):
        query = """
        SELECT concat(player_name,' ',last_name) player
        , player_id 
        FROM players
        where to_char(insert_date,'YYYY-MM-DD') = '2023-06-24'
        """
        return query
    
    def matches_query(self,jornada:int):
        query =f"""
        SELECT
        concat(lt.team, ' vs ' ,vt.team) partido
        , m.match_id
        , to_char(m.match_date, 'YYYY-MM-DD') fecha
        FROM matches m
        JOIN teams lt ON lt.team_id = m.local_team_id 
        JOIN teams vt ON vt.team_id = m.visitor_team_id
        JOIN seasons s ON s.season_id = m.season_id
        WHERE s.season_id = {jornada}
        ORDER BY m.match_no
        """
        return query
    
    def create_dataframe(self,query):
        df_read = pd.read_sql_query(query,connection)
        df = df_read.copy(deep=True)

        return df
    
    def export_excel(self,df):
        os.chdir(export_to)

        df.to_excel(self.choose_filename + '.xlsx',index=False)