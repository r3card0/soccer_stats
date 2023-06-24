# Season app

La app season, es una herramienta que permite registrar nuevas temporadas en base a la liga de futbol que se elija

![interfaz](/img/season_interfaz.png)

Se usó Tkinter como herramienta para crear la interfaz y Postgres como base de datos donde se consulta la información y se registran las nuevas temporadas.

# Desarrollo
Se crearon 3 clases en Python para desplegar la interfaz y ejecutar las tareas de, elección de la liga, ingreso de la nueva temporada, su fecha de inicio y su fecha de fin.

1. La clase main, ejecuta la logica de la clase season
2. La clase season contiene la logica para desplegar la interfaz y la ejecución de las acciones, elegir liga, ingreso de datos y registro en la base de datos
3. La clase moco, contiene funciones auxiliares donde se ejecutan tareas de consulta a la base de datos Postgres, asi como creacion y eliminación de tablas auxiliares.

## class Main

## class Display (season)
En la clase *Display*, dentro del método constructor, se definieron los widgets de la interfaz. Los widgets usados son, Label, Entry, Listbox y Button

El widget Listbox, es implementado para mostrar la lista de las ligas existentes en la base de datos.

El widget Label, es implementado para etiquetar cada elemento. Los elementos son: Ligas, Nueva Temporada, Inicio y Fin.

El widget Entry, es implementado para desplegar las cajas que recibiran los datos para registrar la nueva temporada

El widget Button, es implementado para crear dos botones. El boton *QUIT*, es para cerrar la interfaz. El botón *Submit* permite registrar en la bdt los datos ingresados en los widgets *Entry*

## class Moco



Primero en main.py creo la estructura de la interfaz usando tkinter
```
# librerias
from tkinter import *
from tkinter import ttk

root = Tk()
root.title('Seasons')


# entry point
root.mainloop()
```

# Errores
```
Traceback (most recent call last):
  File "/Users/ideasleon/platzi_edu/Bases_de_Datos/PostgreSQL/proyectos/soccer/soccer_db/02_data_manipulation/apps/app_season/test_main.py", line 3, in <module>
    season = Display()
             ^^^^^^^^^
  File "/Users/ideasleon/platzi_edu/Bases_de_Datos/PostgreSQL/proyectos/soccer/soccer_db/02_data_manipulation/apps/app_season/test_season.py", line 26, in __init__
    self.leagues_listbox.bind("<<ListboxSelect>>",self.fillout)
    ^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'NoneType' object has no attribute 'bind'
```
Se resolvio cuando agregue la linea "A" sobre la linea "B"
```
# add list of leagues into the leagues_listbox
self.update_listbox(season_test.get_leagues_list()) # Linea A

# --- bidings --- #
self.leagues_listbox.bind("<<ListboxSelect>>",self.fillout) # Linea B
```
Ahora me salio el siguiente error
```
Traceback (most recent call last):
  File "/Users/ideasleon/platzi_edu/Bases_de_Datos/PostgreSQL/proyectos/soccer/soccer_db/02_data_manipulation/apps/app_season/test_main.py", line 3, in <module>
    season = Display()
             ^^^^^^^^^
  File "/Users/ideasleon/platzi_edu/Bases_de_Datos/PostgreSQL/proyectos/soccer/soccer_db/02_data_manipulation/apps/app_season/test_season.py", line 25, in __init__
    self.update_listbox(season_test.get_leagues_list())
  File "/Users/ideasleon/platzi_edu/Bases_de_Datos/PostgreSQL/proyectos/soccer/soccer_db/02_data_manipulation/apps/app_season/test_season.py", line 42, in update_listbox
    self.leagues_listbox.delete(0,END)
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'NoneType' object has no attribute 'delete'
```

Este error se corrigió modificando la línea 
```
self.leagues_listbox = Listbox(self.root,width=15).grid(row=1,column=1)  
```
Por
```
self.leagues_listbox = Listbox(self.root,width=15)
self.leagues_listbox.grid(row=1,column=1)  
```
Al parecer, al colocar la línea donde se define la ubicación del widget con la función *grid*, debe ir por separado. Al realizar esta acción, la aplicación dejo de mostrar error.

De este modo, se modificaron los widgets Listbox y Entry, para evitar el error.
