# libraries
from league_insert import Leagues

# data

# instances
league_mx = Leagues('/Users/ideasleon/platzi_edu/Bases_de_Datos/PostgreSQL/proyectos/soccer/soccer_db/02_data_manipulation/data/leagues.csv',['league_name','league_lvl','country_id',])


# operations / actions
leagues_insert = league_mx.insert_data_by_row()

# entry point
def run():
    print('Starting 🕐 . . .')

    # instance operation
    leagues_insert


    print("Insertion it's done 😎")


if __name__ == "__main__":
    run()