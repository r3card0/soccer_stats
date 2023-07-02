import pandas as pd
from connect import Connect
import datetime
import os
from _path import export_to

# global variables
connection = Connect().connect()
cur = connection.cursor()
today = datetime.datetime.now().strftime('%Y-%m-%d')

class ExportData:
    def __init__(self,choose_filename:str) -> None:
        self.choose_filename = choose_filename

    # actions / operations
    def today_ret_players_query(self): # retrieve players loaded today
        query = f"""
        SELECT concat(player_name,' ',last_name) player
        , player_id 
        FROM players
        where to_char(insert_date,'YYYY-MM-DD') = '{today}'
        -- WHERE player_id between 56 and 82  or player_id between 126 and 128
        """
        return query
    

    def retrieve_players_query(self):
        query = """
        SELECT concat(player_name,' ',last_name) player
        , player_id 
        FROM players
        where to_char(insert_date,'YYYY-MM-DD') = '2023-06-30'
        -- WHERE player_id between 56 and 82  or player_id between 126 and 128
        """
        return query
    
    def ret_players_by_season_query(self):
        query = """
        SELECT
        concat(player_name,' ',last_name) player
        , p.player_id
        , t.team equipo
        FROM players_by_team_by_season pts
        JOIN seasons s ON s.season_id = pts.season_id AND s.season_id = 1
        JOIN teams t ON t.team_id = pts.team_id AND t.team_id IN (1,11)
        JOIN players p ON p.player_id = pts.player_id
        ORDER BY 3,2
        """
        return query
    
    def matches_query(self,temporada:int):
        query =f"""
        SELECT
        concat(lt.team, ' vs ' ,vt.team) partido
        , m.match_id
        , to_char(m.match_date, 'YYYY-MM-DD') fecha
        FROM matches m
        JOIN teams lt ON lt.team_id = m.local_team_id 
        JOIN teams vt ON vt.team_id = m.visitor_team_id
        JOIN seasons s ON s.season_id = m.season_id
        WHERE s.season_id = {temporada}
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