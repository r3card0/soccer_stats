CREATE TABLE stadiums
(
    stadium_id SERIAL NOT NULL
    , city_id INTEGER
    , stadium VARCHAR(50) NOT NULL
    , postcode INTEGER
    , coordinates GEOMETRY(Point, 4326)
    , lat NUMERIC
    , lon NUMERIC
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT stadium_id_pkey PRIMARY KEY (stadium_id)
)