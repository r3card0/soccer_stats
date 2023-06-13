CREATE TABLE teams
(
    team_id SERIAL NOT NULL
    , team VARCHAR(50) NOT NULL
    , team_type INTEGER NOT NULL -- 1:national team,2:Club team
    , since_date DATE
    , common_name VARCHAR(30)
    , nick_name VARCHAR(30)
    , insert_date TIMESTAMP DEFAULT NOW()
    , CONSTRAINT team_id_pkey PRIMARY KEY (team_id)
)