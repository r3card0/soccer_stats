# librerias
from tkinter import *
from connect import Connect
from players_insert import Players
from _path import players
from export_data import ExportData
# from moco import Moco

# global variables
connection = Connect().connect()
cur = connection.cursor()

class Display:
    def __init__(self) -> None:
        self.root = Tk()
        self.root.title("Soccer Loader ⚽️")
        self.root.geometry("1000x500")
        self.players = Players(players,['nombre','apellido'])
        self.players_more = Players(players,['nombre','apellido','posicion','nat'])
        self.export_players = ExportData('exp_players')

        # -- buttons -- #
        #submit button
        self.submit_button = Button(self.root, text="Load Players 1 🏃‍♂️",command=self.load_players) # , command=self.submit
        self.submit_button.grid(row=2, column=0)

        self.submit_button = Button(self.root, text="Load Players 2 🏃‍♂️🏃‍♂️",command=self.load_players_more) # , command=self.submit
        self.submit_button.grid(row=3, column=0)

        self.submit_button = Button(self.root, text="Export Players ➡️🧾",command=self.export_players_today) # , command=self.submit
        self.submit_button.grid(row=4, column=0)

        # quit button
        self.quit_button = Button(self.root,text="Quit", command=self.root.destroy)
        self.quit_button.grid(row=2, column=3)

        self.root.mainloop()

    # actions / operations
    def load_players(self):
        player1 = self.players.insert_data_by_row(self.players.insert_players())
        return player1
    
    def load_players_more(self):
        player2 = self.players_more.insert_data_by_row(self.players_more.insert_players_almost())
        return player2
    
    def export_players_today(self): # export players loaded today
        file = self.export_players.export_excel(self.export_players.create_dataframe(self.export_players.today_ret_players_query()))
        return file