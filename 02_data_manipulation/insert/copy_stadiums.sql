copy stadiums(stadium,city_id,lat,lon,coordinates) --(stadium,city_id,lat,lon)
FROM '/Users/ideasleon/platzi_edu/Bases_de_Datos/PostgreSQL/proyectos/soccer/soccer_db/02_data_manipulation/data/stadiums.csv'
DELIMITER ','
CSV HEADER;