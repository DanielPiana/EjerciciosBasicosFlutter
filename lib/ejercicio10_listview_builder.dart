import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class Producto {
  final String nombre;
  final String url;
  final double precio;

  Producto({
    required this.nombre,
    required this.url,
    required this.precio
  });
}
/*Haz una lista de productos usando un ListView, donde cada elemento tenga un
margin y un padding diferente. Añade una imagen del producto, su nombre y
un precio. Aplica bordes y efectos de sombra para cada elemento de la lista.
Usa para ello ListView, Container, Padding, Margin, Image, Text y
BoxDecoration.*/
class HomePage extends StatelessWidget {
   HomePage({super.key});
  final List<Producto> listaProductos = [
    Producto(nombre: "Guacamole", url: "https://s03.s3c.es/imag/_v0/770x420/d/d/2/guacamole-hacendado-montosa-mercadona.jpg", precio: 2.25),
    Producto(nombre: "Hummus", url: "https://i.blogs.es/089622/hummus2/450_1000.jpg", precio: 1.80),
    Producto(nombre: "Chocolate", url: "https://img.asmedia.epimg.net/resizer/v2/IYXMYWKZAFL5DGXFVKJFSZOEU4.jpg?auth=aecba71354248a70a1e3f1662a29620ea33e619df2cf45bd179b5fc37d9e0d8b&width=360&height=203&smart=true", precio: 1.25),
    Producto(nombre: "Chicles", url: "https://digitaldeleon.com/wp-content/uploads/2021/06/producto-mercadona-danar-salud-3.jpg", precio: 1),
    Producto(nombre: "Crema de pistacho", url: "https://okdiario.com/img/2023/03/14/8-productos-nuevos-de-mercadona-que-estan-arrasando-en-marzo-crema-pistachos-620x620.jpg", precio: 3.50)
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listaProductos.length,
        padding: const EdgeInsets.all(5),
        itemBuilder: (
            BuildContext context,int index) {
          final producto = listaProductos[index];
          return Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.black,width: 2),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  offset: Offset(2,2),
                )
              ]
            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(producto.url,width: 100,height: 100,fit: BoxFit.cover),
                const SizedBox(width: 10, height: 1),
                Text(producto.nombre,style: const TextStyle(fontSize: 25,color: Colors.black)),
                const SizedBox(width: 10),
                Text("${producto.precio}€", style: const TextStyle(fontSize: 25,color: Colors.black)),
              ],
            ),
          );
        },
      ),
    );
  }
}
