import os

location = 'C:/Users/21130/DataOps/Trabajo_Parcial/python_parcial/dataset_parcial'

# Validaciones
if not os.path.exists(location):
    os.mkdir(location)
else:
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root,name))
        for name in dirs:
            os.rmdir(os.path.join(root,name))

from kaggle.api.kaggle_api_extended import KaggleApi

api = KaggleApi()
api.authenticate()

print(api.dataset_list())

api.dataset_download_file('bhavikjikadara/student-study-performance','study_performance.csv',path = location,quiet=False)

print('La extraccion del archivo del kaggle se ha hecho exitosamente')