CREATE TABLE match_players
(
    id SERIAL NOT NULL
    , match_id INTEGER
    , player_id INTEGER -- player_team_by_season_id
    , is_beginner BOOLEAN -- if is beginner 1, then is change 0
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT id4_pkey PRIMARY KEY (id) 

)