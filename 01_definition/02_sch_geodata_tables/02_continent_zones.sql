CREATE TABLE geodata.continent_zones
(
    continent_zone_id SERIAL NOT NULL
    , continent_id INTEGER
    , zone_name VARCHAR(30)
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT continent_zone_id_pkey PRIMARY KEY (continent_zone_id)

)