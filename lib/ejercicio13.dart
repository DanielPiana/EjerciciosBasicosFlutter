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
/*.Diseña una pantalla de bienvenida con un texto, una breve descripción y
botones de Login y Registro. Usa “SingleChildScrollView” para hacerla
desplazable en caso de que tengamos pantallas pequeñas. Añade mucho
texto para comprobarlo.*/

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bienvenido!!",
          style: TextStyle(fontSize: 40),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
                "In the vibrant heart of a world teeming with ancient mysteries, a tale unfolds that transcends the bounds of time and space. Amidst the whispers of the wind, echoes of a forgotten civilization resonate, "
                "beckoning the curious to unravel its secrets.The land is rich with the remnants of a bygone era, where towering spires of stone and intricate ruins stand as silent sentinels, their weathered facades hinting at the grandeur of a time long past. The air is thick with the scent of history, each breath carrying the weight of countless stories waiting to be told."
                "Legends speak of powerful artifacts, artifacts that hold the key to unlocking the very fabric of reality. These relics, scattered across the domain, hold the power to either restore balance or plunge the world into chaos, depending on the wielder's intent."
                "Warriors, scholars, and adventurers from all corners of the realm converge, drawn by the allure of uncovering the truth that lies buried beneath the sands of time. Each step they take is a journey of self-discovery, for the answers they seek may well determine the fate of the entire world."
                "In the shadows, forces of darkness conspire, their sinister intentions shrouded in mystery. They seek to harness the power of the ancient artifacts, driven by a desire for dominance that transcends the boundaries of mortal understanding."),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Login")),
                const SizedBox(width: 80),
                ElevatedButton(onPressed: () {}, child: const Text("Registro")),
              ],
            ),
            const SizedBox(height: 80),
            const Text(
                "In the vibrant heart of a world teeming with ancient mysteries, a tale unfolds that transcends the bounds of time and space. Amidst the whispers of the wind, echoes of a forgotten civilization resonate, "
                    "beckoning the curious to unravel its secrets.The land is rich with the remnants of a bygone era, where towering spires of stone and intricate ruins stand as silent sentinels, their weathered facades hinting at the grandeur of a time long past. The air is thick with the scent of history, each breath carrying the weight of countless stories waiting to be told."
                    "Legends speak of powerful artifacts, artifacts that hold the key to unlocking the very fabric of reality. These relics, scattered across the domain, hold the power to either restore balance or plunge the world into chaos, depending on the wielder's intent."
                    "Warriors, scholars, and adventurers from all corners of the realm converge, drawn by the allure of uncovering the truth that lies buried beneath the sands of time. Each step they take is a journey of self-discovery, for the answers they seek may well determine the fate of the entire world."
                    "In the shadows, forces of darkness conspire, their sinister intentions shrouded in mystery. They seek to harness the power of the ancient artifacts, driven by a desire for dominance that transcends the boundaries of mortal understanding."),
          ],
        ),
        ),
      ),
    );
  }
}
