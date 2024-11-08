import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
/*.Crea un formulario de registro que tenga TextFields para nombre, correo
electrónico y contraseña. Usa el widget Form para gestionar la validación, y
añade un botón para enviar el formulario.*/
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}
//CREAMOS LA CLAVE DEL FORMULARIO Y LOS CONTROLADORES PARA CADA CAMPO
class HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

//METODO PARA LIMPIAR RECURSOS Y AHORRAR MEMORIA
  void clearResources() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
//METODO PARA VALIDAR UN FORMULARIO
  void submitForm() {
    if (formKey.currentState!.validate()) {
      String nombre = nameController.text;
      String email = emailController.text;
      String password = passwordController.text;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Formulario enviado correctamente"))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulario",
        style: TextStyle(fontSize: 40,
            fontWeight:FontWeight.bold)
      ),
        centerTitle: true
      ),
      body: Padding(
          padding:
          const EdgeInsets.all(5),
        child:
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nombre: "),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa tu nombre";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Correo: "),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Escribe tu correo";
                  } else if (RegExp(r'^[a-zA-Z0-9]+@gmail\.com$').hasMatch(value)) {
                    return "Ingrese un correo válido";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Contraseña"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Escribe tu contraseña";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: (){
                    submitForm();
                  },
                  child:
                  const Text("Enviar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}