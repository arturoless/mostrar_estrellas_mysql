datos={
    "1":{
        "Reporte":"Contabilidad",
        "id_padre":"0",
        "tipo":"agrupacion"
    },
    "2":{
        "Reporte":"Finanza",
        "id_padre":"6",
        "tipo":"agrupacion"
    },
     "3":{
        "Reporte":"Admin",
        "id_padre":"4",
        "tipo":"agrupacion"
    },
    "4":{
        "Reporte":"Reporte 1",
        "id_padre":"1",
        "tipo":"reporte"
    },
    "5":{
        "Reporte":"Reporte 2",
        "id_padre":"2",
        "tipo":"reporte"
    },
    "6":{
        "Reporte":"Reporte 3",
        "id_padre":"3",
        "tipo":"reporte"
    },
    "7":{
        "Reporte":"Reporte 4",
        "id_padre":"1",
        "tipo":"reporte"
    },
     "8":{
        "Reporte":"Reporte 5",
        "id_padre":"0",
        "tipo":"reporte"
    }
    ,
     "9":{
        "Reporte":"Reporte 6",
        "id_padre":"8",
        "tipo":"reporte"
    }
    ,
     "10":{
        "Reporte":"Reporte 7",
        "id_padre":"9",
        "tipo":"reporte"
    }
}

def buscar(elemento,id,nivel):
    impresion=""
    level=nivel
    level+=1
    for _ in range(level):
        impresion+="\t"
    for _id in range(len(datos)):
        if datos[str(_id+1)]["id_padre"] == id:
            print(impresion+datos[str(_id+1)]["Reporte"])
            buscar(datos[str(_id+1)],str(_id+1),level)
            
    return elemento

    
for _id in range(len(datos)):
    if datos[str(_id+1)]["id_padre"]=="0":
        print(datos[str(_id+1)]["Reporte"])
        buscar(datos[str(_id+1)],str(_id+1),0)


    