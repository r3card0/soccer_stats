CREATE TABLE seasons
(
    season_id SERIAL NOT NULL
    , league_id INTEGER
    , season VARCHAR(30)
    , start_date DATE
    , end_date DATE
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT season_id_pkey PRIMARY KEY (season_id)
)