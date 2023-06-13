/*
Create a relation of what teams
are participated on the season
Stored the team_id list by season
*/
CREATE TABLE teams_by_season
(
    id SERIAL NOT NULL
    , season_id INTEGER NOT NULL
    , team_id INTEGER NOT NULL
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT id_pkey PRIMARY KEY (id)
)