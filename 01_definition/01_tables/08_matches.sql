CREATE TABLE matches
(
    match_id SERIAL NOT NULL
    , season_id INTEGER
    , stadium_id INTEGER
    , match_no INTEGER -- match number
    , week_no INTEGER -- WEEK/jornada
    , round INTEGER -- phase
    , local_team_id INTEGER
    , visitor_team_id INTEGER
    , match_date TIMESTAMP
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT match_id_pkey PRIMARY KEY (match_id)
)