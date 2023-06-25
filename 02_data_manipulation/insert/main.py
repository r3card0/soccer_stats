# libraries
from league_insert import Leagues
from season_insert import Seasons
from team_insert import Teams
from teams_by_season import TeamsBySeason
from stadiums_by_team import StadiumsByTeam
from matches_insert import Matches
from players_insert import Players
from players_by_team_by_season_insert import Players_team_season
from match_players_insert import Match_players
from _path import leagues_file, seasons_file, teams_file, teams_by_season_file, stadiumByTeams, matches, players, players_by_ts, match_players_data

# data

# instances
league_mx = Leagues(leagues_file,['league_name','league_lvl','country_id',])
season_mx = Seasons(seasons_file,['season','league_id','start_date','end_date'])
teams_mx = Teams(teams_file,['team','team_type','country_id'])
teams_season_mx = TeamsBySeason(teams_by_season_file,['season_id','team_id'])
# stadiums_mx_2023 = Stadiums(stadiums_file,['stadium','city_id','lat','lon','coordinates'])
stadium_by_team = StadiumsByTeam(stadiumByTeams,['stadium_id','team_id'])
matches_mx = Matches(matches,['match_no','date','stadiumId','local_team','visitor_team','week_no','round','season_id'])
players_test = Players(players,['nombre','apellido'])
pts = Players_team_season(players_by_ts,['season_id','team_id','player_id','tshirt'])
match_players = Match_players(match_players_data,['match_id','player_id','alineacion_inicial'])

# operations / actions
# leagues_insert = league_mx.insert_data_by_row()
# season_insert = season_mx.insert_data_by_row()
# team_insert = teams_mx.insert_data_by_row()
# tbs_insert = teams_season_mx.insert_data_by_row()
# stadiums_insert = stadiums_mx_2023.insert_data_by_row()
# stadium_by_team_insert = stadium_by_team.insert_data_by_row()
# matches_insert_ = matches_mx.insert_data_by_row()
# players_insert_ = players_test.insert_data_by_row()
# playerby_ts_insert_ = pts.insert_data_by_row()
match_players_insert_ = match_players.insert_data_by_row()



# entry point
def run():
    print('Starting 🕐 . . .')
    match_players_insert_

    # print(stadium_by_team.read_csv_())
    


    print("Insertion it's done 😎")


if __name__ == "__main__":
    run()