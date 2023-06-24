from configparser import ConfigParser
from _path import fuente

class Config:
    def __init__(self) -> None:
        self.parser = ConfigParser()
        self.filename = fuente
        self.database = 'postgresql'

    def config(self):
        db = {}
        self.parser.read(self.filename)

        if self.parser.has_section(self.database):
            self.params = self.parser.items(self.database)
            for param in self.params:
                db[param[0]] = param[1]
        else:
            raise Exception('Section {0} not found in the {1} file'.format(self.database,self.filename))
        
        return db
    
# Instance to test
test = Config().config()
    

def run():
    print(test)

    
if __name__ == "__main__":
    run()