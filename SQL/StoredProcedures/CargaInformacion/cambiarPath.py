
from os import remove

import os

files = ["sp_CargarDepartamentos.sql"
        ,"sp_CargarEliminarEmpleados.sql"
        ,"sp_CargarEmpleados.sql"
        ,"sp_CargarFeriados.sql"
        ,"sp_CargarMarcasAsistencia.sql"
        ,"sp_CargarMesesSemanas.sql"
        ,"sp_CargarPuestos.sql"
        ,"sp_CargarTipoDeduccion.sql"
        ,"sp_CargarTipoDocIdentidad.sql"
        ,"sp_CargarTipoJornada.sql"
        ,"sp_CargarTipoJornadaProximaSemana.sql"
        ,"sp_CargarTipoMovimientoPlanilla.sql"
        ,"sp_CargarUsuarios.sql"
        ]
user = int(input('Ingrese 0 para luis y 1 para sebas: '))
collectionPath = [r"E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml",r"C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml"]
newPath = collectionPath[user]

if user == 0:  
    oldPath = collectionPath[1]
else:
    oldPath = collectionPath[0]
       

for filename in files:
    newFileName = filename
    actualFile = open(filename,'r')
    allInfo = actualFile.read()
    newInfo = allInfo
    actualFile.close()
    os.remove(filename)

    newFile = open(newFileName,'w')
    newInfo = allInfo.replace(oldPath,newPath)
    
    newFile.write(newInfo)
    newFile.close()



