# libraries
from league_insert import Leagues
from season_insert import Seasons
from _path import leagues_file, seasons_file

# data

# instances
league_mx = Leagues(leagues_file,['league_name','league_lvl','country_id',])
season_mx = Seasons(seasons_file,['season','league_id','start_date','end_date'])

# operations / actions
# leagues_insert = league_mx.insert_data_by_row()
season_insert = season_mx.insert_data_by_row()

# entry point
def run():
    print('Starting 🕐 . . .')

    # instance operation
    season_insert


    print("Insertion it's done 😎")


if __name__ == "__main__":
    run()