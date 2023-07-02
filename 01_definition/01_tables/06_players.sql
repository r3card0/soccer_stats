CREATE TABLE players
(
    player_id SERIAL NOT NULL
    , player_name VARCHAR(30) NOT NULL
    , last_name VARCHAR(30) NOT NULL
    , nick_name VARCHAR(30)
    , position INTEGER
    , birthday DATE
    , nationality INTEGER
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT player_id_pkey PRIMARY KEY (player_id)

)