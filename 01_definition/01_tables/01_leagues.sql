CREATE TABLE leagues
(
    league_id SERIAL NOT NULL
    , league_lvl INTEGER
    , country_id INTEGER
    , league_name VARCHAR(30)
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT league_id_pkey PRIMARY KEY (league_id)
)