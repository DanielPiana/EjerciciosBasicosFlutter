import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(
    /*ScopedModel envuelve a la raiz de la aplicación (ContadorApp)*/
    ScopedModel<ContadorModel>(
      //Especificamos el modelo compartido para todos los widgets descendientes
      model: ContadorModel(),
      //Especificamos la aplicacion
      child: ContadorApp(),
    ),
  );
}
//Estructura básica de la aplicación
class ContadorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ScopedModel Ejemplo')),
        body: ContadorDisplay(),//En la clase ContadorDisplay definimos visualmente el contador
        floatingActionButton: IncrementarButton(),//En la clase IncrementarButton definimos visualmente el boton flotante
      ),
    );
  }
}
/*Widget que muestra el valor actual del contador, al utilizar ScopedModelDescendant<ContadorModel>
Podemos acceder a la clase ContadorModel (similar a algo estático)
*/
class ContadorDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContadorModel>(
      builder: (context, child, model) {
        return Center(
          child: Text('Contador: ${model.contador}', style: TextStyle(fontSize: 24)),
        );
      },
    );
  }
}
/*Botón flotante y utiliza ScopedModelDescendant<ContadorModel> para tener acceso al modelo ContadorModel()*/
class IncrementarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContadorModel>(
      builder: (context, child, model) {
        return FloatingActionButton(
          onPressed: model.incrementar,
          child: Icon(Icons.add),
        );
      },
    );
  }
}
//Clase que maneja la logica de la aplicacion, con atributo, un get y un metodo para incrementar
class ContadorModel extends Model {
  int _contador = 5;


  int get contador => _contador;


  void incrementar() {
    _contador++;
    notifyListeners();//Metodo que informa a los widgets que dependen de este modelo
    //Para que se reconstruyan y actualizarse al cambiar datos
  }
}