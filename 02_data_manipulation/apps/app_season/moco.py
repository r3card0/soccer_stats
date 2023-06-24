from connect import Connect
import pandas as pd

# global variables
connection = Connect().connect()
cur = connection.cursor()

class Moco:
    def __init__(self) -> None:
        pass

    # actions / operations
    def get_league_names_query(self):
        query = """
        SELECT league_name from leagues;
        """
        return query
    
    def get_leagues_list(self):
        # select statement
        cur.execute(self.get_league_names_query())
        output = cur.fetchall()

        get_list = []

        for val in output:
            val = ''.join(val)
            get_list.append(val)

        return get_list
    

    def get_inserted_data_query(self,label):
        # fetch data loaded into entry_table(temporal)
        query = """
        
        """
        return query
    

    def create_entry_table(self):
        query = """
        CREATE TABLE entry_seasons
        (
            league VARCHAR(30)
            , season VARCHAR(30)
            , start_date DATE
            , end_date DATE
        )
        """
        return query
    
    def insert_data(self):
        query = """
        INSERT INTO entry_seasons(league,season,start_date,end_date) 
        VALUES(%s,%s,%s,%s)
        """
        return query
    
    def insert_into_seasons(self):
        query = """
        INSERT INTO seasons(season,league_id,start_date,end_date)
        VALUES(%s,%s,%s,%s)
        """
        return query
    

    def select_join(self):
        query = """
        SELECT es.season
        , l.league_id
        , es.start_date
        , es.end_date
        FROM entry_seasons es
        JOIN leagues l ON l.league_name = es.league  
        """
        
        df_read = pd.read_sql_query(query,connection)
        df = df_read.copy(deep=True)

        df['data'] = df[['season','league_id','start_date','end_date']].values.tolist()
        rows = list(df['data'])

        data_list = []

        for data in rows:
            data_list.append(tuple(data))
    
    def drop_entry_table(self):
        query = """
        DROP TABLE entry_seasons
        """
        return query
    

    def submit_create_table(self):
        cur.execute(self.create_entry_table())

        connection.commit()
        connection.close()


    def submit_drop_table(self):
        cur.execute(self.drop_entry_table())

        connection.commit()
        connection.close()

    
    def select_seasons_table(self):
        query = """
        SELECT * FROM seasons
        ORDER BY insert_date desc
        """
        return query

    
    def show_entry_data(self,output_label): # update before
        # Grab stuff from database
        cur.execute(self.select_seasons_table())
        records = cur.fetchall()

        output = ""

        # Loop thru the results
        for record in records:
            output_label.config(text=f"{output}\n{record[0]} {record[1]} {record[2]} {record[3]}")
            output = output_label["text"]

        connection.close()

    def delete_item(self,entry,END):
        entry.delete(0,END)

    def insert_clicked_item(self,entry,listbox,ACTIVE):
        entry.insert(0,listbox.get(ACTIVE))