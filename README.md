# Soccer stats

## Objective 
* This is a personal project to store data from some soccer leagues around the world in order to run some stats
* Just for fun and learn
* Postgres is implemented as a database management system
* Python is implemented to read and load data into the data model

## Requirements
Python
```
pip install pandas openpyxl  psycopg2
```


## Project Status
* In progress: collection and storing data

# Data Model

## Leagues
Stores the name of the league, their country_id where is belongs and the level of the league, for example if the league is the firts level or second level. For example, in Mexico, the top soccer league is the first professional division and it is called: Liga MX. 

## Seasons
A league has many seasons. This object stores the name of the season and the start and end dates. An also, stores the league_id. 

## Teams
This object stores all the soccer teams around the world. There is a field that identifies if the teams it's a club soccer team or it's a national soccer team. Also, stores the country_id of the team.

## Teams by season
This is an associative object where a relation is stablished between all the teams which are participated in an specific season.
