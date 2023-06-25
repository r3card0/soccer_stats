CREATE TABLE players_by_team_by_season
(
    id SERIAL NOT NULL
    , season_id INTEGER NOT NULL
    , team_id INTEGER NOT NULL
    , player_id INTEGER NOT NULL
    , tshirt INTEGER
    , start_date DATE
    , end_date DATE
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT id3_pkey PRIMARY KEY (id)
)