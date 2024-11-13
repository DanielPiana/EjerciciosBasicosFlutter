import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

/*Crea un formulario que tenga campos de texto para nombre, correo
electrónico y contraseña. Añade un botón de envío que valide que todos los
campos están completos y que el correo electrónico es correcto.*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  //CREAMOS LA CLAVE DEL FORMULARIO Y LOS CONTROLADORES PARA CADA CAMPO
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  //CREAMOS METODO PARA LIMPIAR RECURSOS Y AHORRAR MEMORIA
  void clearResources() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    password2Controller.dispose();
  }

  //METODO PARA VALIDAR EL FORMULARIO
  void submitForm() {
    if(formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Formulario enviado correctamente"))
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulario",style: TextStyle(fontSize: 40)),
        centerTitle: true,),
      body: Padding(
          padding:
          const EdgeInsets.all(10),
        child:
        Form( key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Nombre",
                  border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ingresa tu nombre";
                    }
                    return null;
                  }
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Correo electrónico",
                  border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return "Ingresa tu correo electrónico";
                    } else if (!EmailClass().emailCheck(value)) {
                      return "Formato de correo no válido";
                    }
                    return null;
                  }
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: "Contraseña",
                  border: OutlineInputBorder()),
                  obscureText: true,
                  validator: (value) {
                    if (value == null) {
                      return "Escribe una contraseña";
                    } else if (value.isEmpty || value.length < 6) {
                      return "La contraseña debe tener al menos 6 caracteres";
                    }
                    return null;
                  }
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: password2Controller,
                  decoration: const InputDecoration(labelText: "Confirma tu contraseña",
                  border: OutlineInputBorder()),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirma tu contraseña";
                    } else if (!PasswordClass().passwordCheck(passwordController.text, value)) {
                      return "Las contraseñas no coinciden";
                    }
                    return null;
                  }
                ),
                const SizedBox(height: 30),
                ElevatedButton(onPressed: () {
                  submitForm();
                },
                    child: const Text("Enviar"))
              ],
            )
        )
      )
    );
  }

}
//----------------------------------------------------------------------------------------------------------------
//CLASE PASSWORD PARA MANEJAR LAS OPERACIONES DE LA CONTRASEÑA
class PasswordClass {
  //METODO PARA VALIDAR QUE LAS CONTRASEÑAS SEAN IGUALES, DEVUELVE TRUE SI ES ASI
  bool passwordCheck(String password, String password2) {
    return password == password2;
  }
}
//----------------------------------------------------------------------------------------------------------------
//CLASE EMAIL PARA MANEJAR LAS OPERACIONES DEL EMAIL
class EmailClass {
  //METODO PARA VALIDAR QUE EL CORREO TENGA FORMATO CORRECTO
  bool emailCheck(String email) {
    return RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email);
  }
}