import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,

        leading: IconButton(
          onPressed: (){}, 
        icon: const Icon(Icons.menu)),
        title: const Text("AppBar"),
        actions: [
          IconButton(onPressed: (){},
           icon: const Icon(Icons.camera_alt)),
          IconButton(onPressed: (){},
           icon: const Icon(Icons.add)),
          IconButton(onPressed: (){},
           icon: const Icon(Icons.hourglass_empty)),
        ],
      ),
      body: const Center(
        child: Text("AppBar Example",
        style: TextStyle(fontSize: 22),
        ),
      
      ),
    );
  }
}