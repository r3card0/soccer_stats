CREATE TABLE geodata.admin_level
(
    admin_lvl_id SERIAL NOT NULL
    , admin_type VARCHAR(30)
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT admin_lvl_id_pkey PRIMARY KEY (admin_lvl_id)
)