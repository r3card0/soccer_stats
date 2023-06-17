SELECT stadium, c.city_name 
FROM stadiums_mx st 
JOIN geodata.cities c ON c.city_id = st.city_id;