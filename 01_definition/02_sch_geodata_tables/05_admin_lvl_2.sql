CREATE TABLE geodata.admin_lvl_2
(
    alvl2_id SERIAL NOT NULL
    , country_id INTEGER
    , admin_lvl_id INTEGER
    , admin_name VARCHAR(30)
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT alvl2_id_pkey PRIMARY KEY (alvl2_id)
)