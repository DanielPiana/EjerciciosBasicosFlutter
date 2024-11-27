import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

/*Implementa una lista de tareas en la que el usuario pueda marcar las tareas
como completadas utilizando Checkbox. En caso de que la marque, el texto
debe cambiar a color gris claro y tacharse.
1. Como extra, que el usuario pueda añadir tareas con algún tipo de Form.*/
//---------------------------------------------------------------------------------------------------------------------
class _HomepageState extends State<HomePage> {
  //CREO UNA LISTA DE DICCIONARIOS DONDE CADA DICCIONARIO ES UNA TAREA
  List<Map<String, dynamic>> tareas = [
    {"titulo": "Tarea 1", "completado": false},
    {"titulo": "Tarea 2", "completado": false},
    {"titulo": "Tarea 3", "completado": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Lista de tareas", style: TextStyle(fontSize: 40)),
          centerTitle: true,
          backgroundColor: Colors.blue),
      body: ListView.separated(
          //PIDE UN CONSTRUCTOR DE CADA ITEM QUE VA A IR EN LA LISTA, QUE PIDE CONTEXTO E INDEX (POSICIÓN DE LA LISTA PARA IDENTIFICAR EL ITEM)
          itemBuilder: (context, index) {
            //ITEM BUILDER VA A CONSTRUIR CADA ITEM DE LA LISTA
            return ListTile(
              leading: Checkbox(
                  //EL VALUE DE CHECKBOX ES UN BOOLEANO, POR LO TANTO USAMOS EL BOOLEANO DE CADA ITEM
                  //DE LA LISTA PARA DECIR SI ESTA COMPLETADA O NO
                  value: tareas[index]["completado"],
                  onChanged: (bool? value) {
                    //CUANDO ON CHANGED RECIBE UN VALUE, ES O TRUE O FALSE
                    //ENTONCES PODEMOS SETEAR EL BOOLEANO DEL ITEM DE LA LISTA AL ESTADO QUE RECIBE EL ONCHANGED
                    setState(() {
                      tareas[index]["completado"] = value;
                    });
                  }),
              title: Text(
                tareas[index]["titulo"], //PONEMOS EL TITULO
                style: TextStyle(
                    //LE DAMOS UN ESTILO AL TITULO CUANDO EL VALOR DE "completado" SEA TRUE, Y OTRO CUANDO SEA FALSE
                    //SI TAREAS[INDEX]["COMPLETADO"] ES TRUE, TACHAMOS EL TEXTO Y SI ES FALSO, NO HACEMOS NADA
                    decoration: tareas[index]["completado"]
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    //LO MISMO CON EL COLOR, SI ES TRUE, LO PONEMOS GRIS, Y SI ES FALSE, BLANCO
                    color: tareas[index]["completado"]
                        ? Colors.grey
                        : Colors.white),
              ),
              //AÑADIMOS UN BOTON PARA ELIMINAR LA TAREA
              trailing: ElevatedButton(onPressed: () {
                //LLAMAMOS AL METODO _ELIMINACIONTAREA Y LE PASAMOS EL VALOR
                //DE "TITULO" EN EL DICCIONARIO QUE TUVIESE ESE BOTÓN
                _eliminacionTarea(tareas[index]["titulo"]);
              }, child: const Text("Eliminar")),
            );
          },
          //UN CONSTRUCTOR DEL SEPARADOR DE ITEMS, QUE PIDE CONTEXTO E INDEX
          // (POSICIÓN DE LA LISTA PARA IDENTIFICAR EL ITEM)
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.white,
            );
          },
          //CANTIDAD DE ITEMS
          itemCount: tareas.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _creacionTarea();
        },
        child: const Icon(Icons.add),
      ),
    );
  }


//---------------------------------------------------------------------------------------------------------------------
  void _eliminacionTarea(String titulo) {
    int index = -1;

    showDialog(context: context,
        builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Eliminar tarea"),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context); //CIERRA EL SHOWDIALOG
          }, child: const Text("Cancelar")),
          TextButton(onPressed: () {
            setState(() {
              //OBTENEMOS EL INDICE DEL DICCIONARIO QUE QUEREMOS BORRAR DE LA LISTA DE
              //DICCIONARIOS CON UNA ESPECIE DE CONSULTA
              //INDEX = INDEX DONDE TAREA["TITULO"] = AL TITULO QUE PASO COMO PARAMETRO
              index = tareas.indexWhere((tarea) => tarea["titulo"] == titulo);
              if (index != -1) {
                tareas.removeAt(index);
              }
              Navigator.pop(context);
            });
          }, child: const Text("Eliminar"))
        ],
      );
        });
  }
//---------------------------------------------------------------------------------------------------------------------
  void _creacionTarea() {
    String titulo = "";
    String tituloNuevo="";

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Añadir nueva tarea"),
            content: TextField(
              onChanged: (value) {
                titulo = value;
              },
              decoration: const InputDecoration(hintText: "Escribe la nueva tarea"),
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
              ),
              TextButton(onPressed: () {
                setState(() {
                  tituloNuevo = _comprobarTarea(titulo);
                  tareas.add({
                    "titulo": tituloNuevo,
                    "completado": false
                  });
                });
                Navigator.pop(context);
              }, child: const Text("Añadir"),
              ),
            ],
          );
        }
    );
  }

//---------------------------------------------------------------------------------------------------------------------
  String _comprobarTarea(String titulo) {
    String tituloOriginal = titulo;
    int contador=1;
    for (Map<String,dynamic> tarea in tareas) {
      if (tarea["titulo"] == titulo) {
        titulo = tituloOriginal + contador.toString();
        contador ++;
      }
    }
    return titulo;
  }
}