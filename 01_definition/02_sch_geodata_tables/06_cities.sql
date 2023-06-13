CREATE TABLE geodata.cities
(
    city_id SERIAL NOT NULL
    , alvl2_id INTEGER
    , city_name VARCHAR(30)
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT city_id_pkey PRIMARY KEY (city_id)
)