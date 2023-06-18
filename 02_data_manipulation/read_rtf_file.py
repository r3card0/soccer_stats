import pandas as pd
import os

def read_source_file():
    df = pd.read_csv('/Users/ideasleon/platzi_edu/Bases_de_Datos/PostgreSQL/proyectos/soccer/soccer_db/02_data_manipulation/test.txt',delimiter = '\t')
    data = list(df['numero'])
    new_data = []

    for val in data:
        new_data.append(str(val).strip())
    # df_data = pd.DataFrame(new_data)

    n_data = []
    for val2 in new_data:
        n_data.append(str(val2).split())

    df_data = pd.DataFrame(n_data)
    
    df_data.columns = ['numero','nombre','apellido','ape_more']
    # df_data = df_data.dropna(how='any') 
    

    os.chdir('/Users/ideasleon/platzi_edu/Bases_de_Datos/PostgreSQL/proyectos/soccer/soccer_db/02_data_manipulation/data')

    df_data.to_excel('demo.xlsx',index=False)
    # return df_data


def run():
    print(read_source_file())
    # print('output created ✅')


if __name__ == "__main__":
    run()