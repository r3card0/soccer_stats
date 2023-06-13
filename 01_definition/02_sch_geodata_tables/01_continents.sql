CREATE TABLE geodata.continents
(
    continent_id SERIAL NOT NULL
    , continent_name VARCHAR(30)
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT contId_pkey PRIMARY KEY (continent_id)
)
