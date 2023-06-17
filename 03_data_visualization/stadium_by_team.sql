/* estadio por equipo*/
select team , stadium
from teams t
JOIN stadiums_by_team sbt ON sbt.team_id = t.team_id
JOIN stadiums_mx st ON st.id = sbt.stadium_id
ORDER BY 1