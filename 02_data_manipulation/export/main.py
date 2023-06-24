from export_data import ExportData

# instances
export_players = ExportData('exp_players')
exp_players_file = export_players.export_excel(export_players.create_dataframe(export_players.retrieve_players_query()))

# export_matches = ExportData('exp_matches')
# expo_matches_file = export_matches.export_excel(export_matches.create_dataframe(export_matches.matches_query(2))) # elegir la jornada -> week.no

# entry point
def run():
    print('Starting to export data 😎')
    exp_players_file
    print('The output it is ready ✅')

if __name__ == "__main__":
    run()