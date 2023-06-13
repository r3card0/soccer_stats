# libraries
from league_insert import Leagues
from season_insert import Seasons
from team_insert import Teams
from _path import leagues_file, seasons_file, teams_file

# data

# instances
league_mx = Leagues(leagues_file,['league_name','league_lvl','country_id',])
season_mx = Seasons(seasons_file,['season','league_id','start_date','end_date'])
teams_mx = Teams(teams_file,['team','team_type'])



# operations / actions
# leagues_insert = league_mx.insert_data_by_row()
# season_insert = season_mx.insert_data_by_row()
team_insert = teams_mx.insert_data_by_row()

# entry point
def run():
    print('Starting 🕐 . . .')

    # instance operation
    team_insert


    print("Insertion it's done 😎")


if __name__ == "__main__":
    run()