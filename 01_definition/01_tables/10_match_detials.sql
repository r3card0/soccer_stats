CREATE TABLE match_details
(
    match_detial_id SERIAL NOT NULL
    , match_id INTEGER NOT NULL
    , half INTEGER NOT NULL
    , minute INTEGER NOT NULL
    , action_id INTEGER NOT NULL
    , player_id INTEGER NOT NULL 
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT match_detial_id_pkey PRIMARY KEY (match_detial_id)
)