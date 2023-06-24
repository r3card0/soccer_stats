from connect import Connect
from tkinter import *
from moco import Moco

# global variables
connection = Connect().connect()
cur = connection.cursor()

# Instances
season_moco = Moco()

# Título
root = Tk()
root.title("Registrar nueva Temporada (Season)")
root.geometry("1000x500")
leagues_list = season_moco.get_leagues_list()

# -- actions and operations -- #
# update the listbox
def update_leagues_listbox(data):
    # clear listbox
    leagues_listbox.delete(0,END)

    # add products to listbox
    for item in data:
        leagues_listbox.insert(END, item)




# update entry box with listbox clicked
def fillout(e):
    # Delete whatever is in entry box
    leagues_entry.delete(0,END)

    # Add clicked list item to entry box
    leagues_entry.insert(0,leagues_listbox.get(ACTIVE))


# create function to checl entry vs listbox
def check(e):
    # grab waht was typed
    typed = leagues_entry.get()

    if type == "":
        data = leagues_list
    
    else:
        data =[]
        for item in leagues_list:
            if typed.lower() in item.lower():
                data.append(item)
    
    # update our listbox with select items
    update_leagues_listbox(data)



def clear():
    leagues_entry.delete(0,END)
    start_date_entry.delete(0,END)
    season_entry.delete(0,END)
    end_date_entry.delete(0,END)


def submit():

    # create entry_seasons table
    cur.execute(season_moco.create_entry_table())
    connection.commit()

    # preliminary step to insert into entry_table
    cur.execute(season_moco.insert_data(),(leagues_entry.get(),season_entry.get(),start_date_entry.get(),end_date_entry.get()))
    connection.commit()

    # insert the new season into seasons table
    cur.execute(season_moco.insert_into_seasons(),season_moco.select_join())
    connection.commit()

    # drop entry_seasons table
    cur.execute(season_moco.drop_entry_table())


    connection.commit()
    connection.close()

    update()
    clear()

def update():

    # Grab stuff from database
    cur.execute("SELECT * FROM seasons ORDER BY insert_date desc LIMIT 10 ")
    records = cur.fetchall()

    output = ""

    # Loop thru the results
    for record in records:
        output_label.config(text=f"{output}\n{record[0]} {record[1]} {record[2]} {record[3]}")
        output = output_label["text"]

    connection.close()


# create the listbox of leagues
leagues_listbox = Listbox(root, width=15)
leagues_listbox.grid(row=1, column=1)


# add list of leagues into leagues_listbox
update_leagues_listbox(leagues_list)


# create a binding on the listbox on click
leagues_listbox.bind("<<ListboxSelect>>",fillout)


# Create the GUI for the app
leagues_label = Label(root, text= "Ligas: ").grid(row=0, column=0)
leagues_entry = Entry(root, width=15)
leagues_entry.grid(row=0, column=1)

season_label = Label(root, text="Ingresar Temporada: ").grid(row=0, column=2)
season_entry = Entry(root, width=15)
season_entry.grid(row=0,column=3)

start_date_label = Label(root, text="Inicio: ").grid(row=0, column=4)
start_date_entry = Entry(root, width=10)
start_date_entry.grid(row=0,column=5)

end_date_label = Label(root, text="Fin: ").grid(row=0, column=6)
end_date_entry = Entry(root, width=10)
end_date_entry.grid(row=0,column=7)



#submit button
submit_button = Button(root, text="Submit", command=submit)
submit_button.grid(row=2, column=0)

# quit button
quit_button = Button(root,text="Quit", command=root.destroy)
quit_button.grid(row=2, column=3)

#update button
# update_button = Button(root,text="Update", command=update)
# update_button.grid(row=2, column=3)

# output
output_label = Label(root,text="", width=20)
output_label.grid(row=4, columnspan=6, sticky="W,E")

# create a binding on the entrybox
leagues_entry.bind("<KeyRelease>",check)


root.mainloop()






# # ----- Segundo Intento ---------#
# # Título
# window_season = Tk()
# window_season.title("Registrar nueva Temporada (Season)")
# window_season.geometry("1000x500")

# # Instances
# season_test = Moco()

# # actions
# # clean the entry boxes of the listed entries
# def clear(entry_list:list):
#     for entry in entry_list:
#         entry.delete(0,END)
    

# # submit the action to register the new season
# def submit():
#     # create entry_seasons table
#     cur.execute(season_test.create_entry_table())
#     # preliminary step to insert into entry_table
#     cur.execute(season_test.insert_data(),(leagues_entry.get(),new_season_entry.get(),start_entry.get(),end_entry.get())) 
#     # insert the new season into seasons table
#     cur.execute(season_test.insert_into_seasons(),season_test.select_join())
#     # drop entry_seasons table
#     cur.execute(season_test.drop_entry_table())

#     connection.commit()
#     connection.close()

#     season_test.show_entry_data(output)
#     clear(entries_list)

# # There are two actions to perform into leagues_entry box
# # that takes an item coming from the listbox
# def fillout():    
#     # 1. Delete whatever is in the leagues_entry box
#     leagues_entry.delete(0,END)

#     # 2. Add clicked list item to leagues_entry box
#     leagues_entry.insert(0,leagues_listbox.get(ACTIVE))


# def update_listbox(data):
#     # clear the listbox
#     leagues_listbox.delete(0,END)

#     # add productos to the listbox
#     for item in data:
#         leagues_listbox.insert(END,item)

# # this function check entry vs listbox
# def check(e):
#     typed = leagues_entry.get()

#     if type == "":
#         data = season_test.get_leagues_list()

#     else:
#         data = []
#         for item in season_test.get_leagues_list():
#             if typed.lower() in item.lower():
#                 data.append(item)

#     # update the listbox with selected items
#     update_listbox(data)

# # labels and entries widgets
# leagues = Label(window_season, text= " Ligas:").grid(column=0,row=0)
# leagues_entry = Entry(window_season,width=15).grid(column=1,row=0)

# new_season = Label(window_season, text=" Nueva Temporada:").grid(column=2,row=0)
# new_season_entry = Entry(window_season,width=15).grid(column=3,row=0)

# start = Label(window_season, text=" Inicio:").grid(column=4,row=0)
# start_entry = Entry(window_season,width=15).grid(column=5,row=0)

# end = Label(window_season, text=" Fin:").grid(column=6,row=0)
# end_entry = Entry(window_season,width=15).grid(column=7,row=0)

# output = Label(window_season,text="",width=20).grid(row=4,columnspan=6,sticky="W,E")

# # list of entries that will be implemented on the clear function
# entries_list = [leagues_entry,new_season_entry,start_entry,end_entry]

# # Create a binding on the entry box
# # leagues_entry.bind("<KeyRelease>",check)

# # listbox
# leagues_listbox = Listbox(window_season,width=15).grid(column=1,row=1)

# # Create a binding on the listbox on click
# # leagues_listbox.bind("<<ListboxSelect>>",fillout)

# # submit button
# submit_button = Button(window_season, text="Submit", command=submit)
# submit_button.grid(row=2, column=0)

# # quit button
# quit_button = Button(window_season, text='Quit', command=window_season.destroy).grid(row=2,column=6)


# # entry point
# window_season.mainloop()



    
    # # update the listbox
    # def update_listbox(self,data,listbox):
    #     listbox.delete(0,END) # clear the listbox

    #     for item in data:
    #         listbox.insert(END,item)
    
    # def test_update_listbox(self,func):
    #     def wrapper(typed_entry,listbox,data):
    #         func(typed_entry,listbox,data)
    #         listbox.delete(0,END) # clear the listbox

    #         for item in data:
    #             listbox.insert(END,item)
    #     return wrapper
    
    # # @test_update_listbox
    # def check(self,typed_entry,listbox):
    #     typed = typed_entry.get()

    #     if type == "":
    #         data = self.get_leagues_list()

    #     else:
    #         data = []

    #         for item in self.get_leagues_list():
    #             if typed.lower() in item.lower():
    #                 data.append(item)

    #     # update the listbox with selected items
    #     # self.update_listbox(data,listbox)

    

    
    # def update(self,label):
    #     # fetch data loaded into entry_table(temporal)
    #     query = """
        
    #     """
    #     cur.execute(query)
    #     records = cur.fetchall()

    #     output = ""

    #     # loop results
    #     for record in records:
    #         label.config(text=f"{output}\n{record[0]} {record[1]} {record[2]} {record[3]}")
    #         output = label["text"]

    #     connection.close()

# ------- Primer Intento -------#
# # librerias
# from tkinter import *
# from tkinter import ttk
# from connect import Connect
# import pandas as pd
# # from league_id import LeagueId

# # global variables
# connection = Connect().connect()
# cur = connection.cursor()

# class Test:
#     def __init__(self,window_name:str) -> None:
#         self.window_name = window_name
#         # self.entry_to_store = entry_to_store # entry that is going to store. Type


#     # actions / operations

#     def insert_seasons_statement(self):
#         insert_ = "INSERT INTO seasons(season,league_id,start_date,end_date) VALUES(%s,%s,%s,%s)"
#         return insert_
    
#     def get_league_names_query(self):
#         query = """
#         SELECT league_name from leagues;
#         """
#         return query
    
#     def get_leagueId(self):
#         # select statement
#         query = """
#         SELECT league_id, league_name
#         FROM leagues
#         """

#         # create dataframe
#         df_read = pd.read_sql_query(query,connection)
#         df = df_read.copy(deep=True)

#         return df
    
#     def create_dicto_replace(self):
#         df = self.get_leagueId()

#         df['data'] = df[['league_name','league_id']].values.tolist()
#         rows = list(df['data'])        

#         return dict(rows)    # dictionary {} 
    

#     def get_key(self):
#         for key_value in self.create_dicto_replace().keys():
#             return key_value
        
#     def get_item(self):
#         for item in self.create_dicto_replace().values():
#             return item
          

    

#     def clear(self,entry_list:list):
#         for entry in entry_list:
#             entry.delete(0,END)
#         # entry_to_store.delete(0,END)

#     # def submit(self,entry_tuple:tuple):
#     #     cur.execute(self.insert_seasons_statement(), entry_tuple
#     #     )
    
#     #     connection.commit()
#     #     connection.close()

#     #     self.clear(self.entry_list)

    

#     def get_leagues_list(self):
#         # select statement
#         cur.execute(self.get_league_names_query())
#         output = cur.fetchall()

#         get_list = []

#         for val in output:
#             val = ''.join(val)
#             get_list.append(val)

#         return get_list
    
#     def update_listbox(self,data:list,listbox):
#         # clear listbox
#         listbox.delete(0,END)

#         # show list item into listbox
#         for item in data:
#             listbox.insert(END,item)


#     def fillout(self,listbox):
#         listbox.delete(0,END)
#         listbox.insert(0,listbox.get(ACTIVE))


#     def grab_what_was_type(self,entry_type,listbox):
#         typed = entry_type.get() # entry that will be selected to refer to

#         if typed == "":
#             data = self.get_leagues_list()

#         else:
#             data = []
#             for item in self.get_leagues_list():
#                 if typed.lower() in item.lower():
#                     data.append(item)

#         # update the listbox with selected items
#         self.update_listbox(data,listbox)

#     def replace_func(self,entry_get):
#         entry_to_store = entry_get.replace(self.create_dicto_replace())
#         return entry_to_store




#     def display_window(self):
#         entry_window = Tk()
#         entry_window.title(self.window_name)

#         mainframe = ttk.Frame(entry_window, padding="3 3 12 12")
#         mainframe.grid(column=0, row=0, sticky=(N, W, E, S))
#         entry_window.columnconfigure(0, weight=1)
#         entry_window.rowconfigure(0, weight=1)

#         def submit():
#             cur.execute(self.insert_seasons_statement(),entries_tuple)
#             connection.commit()
#             connection.close()

#             self.clear(self.entry_list)

#         # entries
#         leagues = StringVar()
#         leagues_label = ttk.Label(mainframe, text="leagues").grid(column=1,row=1,sticky=W)
#         leagues_entry = ttk.Entry(mainframe,width=15,textvariable=leagues)
#         leagues_entry.grid(column=2,row=1,sticky=(W,E))
#         leagues_list = self.get_leagues_list()

#         season = StringVar()
#         season_label = ttk.Label(mainframe, text="Nueva Temporada").grid(column=4, row=1, sticky=W)
#         season_entry = ttk.Entry(mainframe, width=20, textvariable=season)
#         season_entry.grid(column=5, row=1, sticky=(W, E))

#         start_date = StringVar()
#         start_date_label = ttk.Label(mainframe, text="Inicio").grid(column=7,row=1,sticky=W)
#         start_date_entry = ttk.Entry(mainframe, width=15, textvariable=start_date)
#         start_date_entry.grid(column=8,row=1,sticky=(W,E))

#         end_date = StringVar()
#         end_date_label = ttk.Label(mainframe, text="Fin").grid(column=10,row=1,sticky=W)
#         end_date_entry = ttk.Entry(mainframe, width=15, textvariable=end_date)
#         end_date_entry.grid(column=11,row=1,sticky=(W,E))

#         entry_list = [leagues_entry,season_entry,start_date_entry,end_date_entry]
#         clear_data = self.clear(entry_list)

#         # replace function
#         entry_id = leagues_entry.get().replace(self.get_key(),str(self.get_item()))
#         entry_id = int(int(entry_id))

#         entries_tuple = (season_entry.get(),entry_id,start_date_entry.get(),end_date_entry.get()) # start_date and end_date

#         # list box
#         leagues_listbox = Listbox(mainframe,width=15)
#         leagues_listbox.grid(column=2,row=2,sticky=E)

#         # Create a binding on the listbox onclick
#         fillout = self.fillout(leagues_listbox)
#         leagues_listbox.bind("<<ListboxSelect>>",fillout)

#         # create a binding on the entry box
        
#         check = self.grab_what_was_type(leagues_entry,leagues_listbox)
#         leagues_entry.bind("<KeyRelease>",check)

        



#         #submit button
#         # submit_var = self.submit(entries_tuple)
#         submit_button = Button(entry_window, text="Submit", command=submit)
#         submit_button.grid(row=2, column=0)

#         # quit button
#         frm = ttk.Frame(entry_window, padding=10)
#         frm.grid()
#         ttk.Button(frm, text="Quit", command=entry_window.destroy).grid(row=9)


#         return entry_window.mainloop()