-- Report of matches
SELECT 
to_char(match_date ,'YYYY-MM-DD') fecha
, to_char(match_date, 'HH:MM') horario
, stadium estadio
, lt.team equipo_local
, vt.team equipo_visitante
, concat(lt.team, ' vs ' ,vt.team) partido
, m.week_no jornada
, 
case
	when round = 0 then 'regular'
	when round = 1 then 'liguilla'
	when round = 2 then 'repechaje'
end fase
, st.geom
FROM matches m
JOIN stadiums_mx st ON st.id = m.stadium_id
JOIN teams lt ON lt.team_id = m.local_team_id 
JOIN teams vt ON vt.team_id = m.visitor_team_id
ORDER BY 1,2
