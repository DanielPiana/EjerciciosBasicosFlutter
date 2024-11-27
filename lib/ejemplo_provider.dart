import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // Este widget envuelve la raiz de la aplicacion y proporciona un modelo
      //Se una para crear la instancia del modelo para que se pueda acceder a el
      create: (context) => ContadorProvider(),
      //Widget que estará envuelto por ChangeNotifierProvider
      child: ContadorApp(),
    ),
  );
}
/*Dentro de ContadorApp, todos los widgets hijos (como ContadorDisplay
e IncrementarButton) pueden acceder al modelo ContadorProvider usando el contexto.*/

//Esta clase define la estructura básica de la aplicación
class ContadorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ProviderEjemplo')),
        body: ContadorDisplay(), //Define el contador
        floatingActionButton: IncrementarButton(), //Define el botón
      ),
    );
  }
}

//Muestra el valor actual del contador
class ContadorDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contador = context.watch<ContadorProvider>().contador;
    return Center(
      child: Text('Contador: $contador', style: TextStyle(fontSize: 24)),
    );
  }
}

class IncrementarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<ContadorProvider>().incrementar();
      },
      child: Icon(Icons.add),
    );
  }
}

class ContadorProvider extends ChangeNotifier {
  int _contador = 5;

  int get contador => _contador;

  void incrementar() {
    _contador++;
    notifyListeners();
  }
}
