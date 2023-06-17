CREATE TABLE stadiums_by_team
(
    id SERIAL NOT NULL
    , stadium_id INTEGER
    , team_id INTEGER
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT id2_pkey PRIMARY KEY (id)
)