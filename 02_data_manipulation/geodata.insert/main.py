# libraries
from geo_insert import InsertGeodata
import datetime
from _path import countries, estados_mx, cities

# data
insert_date = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

continent_list = ['America','Africa','Asia','Antartica','Oceania','Europe']
zone_tuple_list =[('North America',1), ('South America',1),('Middle East',3)]
admin_lvl_list = ['state','municipality']


# instances
continents = InsertGeodata(None,continent_list,None)
continent_zones = InsertGeodata(None,zone_tuple_list,None)
countries_q = InsertGeodata(countries,None,['country_name','continent_id','cont_zone_id',])
admins = InsertGeodata(None,admin_lvl_list,None)
estados_mx_ = InsertGeodata(estados_mx,None,['admin_name','admin_lvl_id','country_id'])
ciudades_estadios_mx = InsertGeodata(cities,None,['city_name','alvl2_id'])


# operations
# continent_insert = continents.insert_data(continents.insert_continents())
# continent_zones_insert = continent_zones.insert_data_tuple(continent_zones.insert_continent_zones())
# countries_q_insert = countries_q.insert_data_by_row(countries_q.insert_countries())
# admins_insert = admins.insert_data(admins.insert_admin_level())
# estados_mx_insert = estados_mx_.insert_data_by_row(estados_mx_.insert_admin_lvl_2())
ciudades_estadios_mx_insert = ciudades_estadios_mx.insert_data_by_row(ciudades_estadios_mx.insert_cities())



# entry point
def run():
    print('Starting 🕐 . . .')

    # instance operation
    ciudades_estadios_mx_insert
    
    

    print("Insertion it's done 😎")


if __name__ == "__main__":
    run()