# librerias
from tkinter import *
from connect import Connect
from moco import Moco

# global variables
connection = Connect().connect()
cur = connection.cursor()


class Display:
    def __init__(self) -> None:
        self.root = Tk()
        self.root.title("Registrar nueva Temporada (Season)")
        self.root.geometry("1000x500")
        self.season_tools = Moco()
        self.leagues_list = self.season_tools.get_leagues_list()
        
        # --- listbox --- #
        self.leagues_listbox = Listbox(self.root,width=15)
        self.leagues_listbox.grid(row=1,column=1)        
        
        # --- add list of leagues into the leagues_listbox        
        self.update_listbox(self.leagues_list)
        
        # --- biding to listbox --- #
        self.leagues_listbox.bind("<<ListboxSelect>>",self.fillout)
        

        # --- labels and entries (widgets) --- #
        self.leagues = Label(self.root,text="Ligas:").grid(column=0,row=0)
        self.leagues_entry = Entry(self.root,width=15)
        self.leagues_entry.grid(row=0,column=1)

        self.new_season = Label(self.root, text="Ingresar Temporada: ").grid(row=0, column=2)
        self.new_season_entry = Entry(self.root, width=15)
        self.new_season_entry.grid(row=0,column=3)

        self.start_date_label = Label(self.root, text="Inicio: ").grid(row=0, column=4)
        self.start_date_entry = Entry(self.root, width=10)
        self.start_date_entry.grid(row=0,column=5)

        self.end_date_label = Label(self.root, text="Fin: ").grid(row=0, column=6)
        self.end_date_entry = Entry(self.root, width=10)
        self.end_date_entry.grid(row=0,column=7)

        # entry list
        self.entries_list = [self.leagues_entry,self.new_season_entry,self.start_date_entry,self.end_date_entry]

        # -- buttons -- #
        #submit button
        self.submit_button = Button(self.root, text="Submit", command=self.submit)
        self.submit_button.grid(row=2, column=0)

        # quit button
        self.quit_button = Button(self.root,text="Quit", command=self.root.destroy)
        self.quit_button.grid(row=2, column=3)

        # -- output -- #
        self.output_label = Label(self.root,text="", width=20)
        self.output_label.grid(row=4, columnspan=6, sticky="W,E")

        # --- biding to entry --- #        
        self.leagues_entry.bind("<KeyRelease>",self.check)


        self.root.mainloop()

    # actions / operations -> Instance's methods
    def fillout(self,e):
        self.leagues_entry.delete(0,END)
        self.leagues_entry.insert(0,self.leagues_listbox.get(ACTIVE))

    # update the listbox
    def update_listbox(self,data):
        # clear the listbox
        self.leagues_listbox.delete(0,END)

        # add items to the listbox
        for item in data:
            self.leagues_listbox.insert(END, item)

 
    # check entry typed vs listbox item
    def check(self,e):
        typed = self.leagues_entry.get()

        if typed == "":
            data = self.leagues_list
        else:
            data = []
            for item in self.leagues_list:
                if typed.lower() in item.lower():
                    data.append(item)

        # update the listbox with the selected item
        self.update_listbox(data)

    
    def clear(self,entry_list:list):
        for entry in entry_list:
            entry.delete(0,END)


    def submit(self):
        # create entry_seasons table
        cur.execute(self.season_tools.create_entry_table())
        connection.commit()

        # preliminary step to insert into entry_table
        cur.execute(self.season_tools.insert_data(),(self.leagues_entry.get(),self.season_entry.get(),self.start_date_entry.get(),self.end_date_entry.get()))
        connection.commit()

        # insert the new season into seasons table
        cur.execute(self.season_tools.insert_into_seasons(),self.season_tools.select_join())
        connection.commit()

        # drop entry_seasons table
        cur.execute(self.season_tools.drop_entry_table())


        connection.commit()
        connection.close()

        #update()
        self.clear(self.entries_list)

    def update(self):
        # Grab stuff from database
        cur.execute("SELECT * FROM seasons ORDER BY insert_date desc LIMIT 10 ")
        records = cur.fetchall()

        output = ""

        # Loop thru the results
        for record in records:
            self.output_label.config(text=f"{output}\n{record[0]} {record[1]} {record[2]} {record[3]}")
            output = self.output_label["text"]

        
        connection.close()