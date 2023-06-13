CREATE TABLE geodata.countries
(
    country_id SERIAL NOT NULL
    , continent_id INTEGER NOT NULL
    , continent_zone_id INTEGER
    , country_name VARCHAR(30)
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT country_id_pkey PRIMARY KEY (country_id)
)