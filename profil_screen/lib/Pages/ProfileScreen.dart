import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      // � Custom AppBar 
      appBar: AppBar( 
        title: const Text( 
          'User Profile', 
          style: TextStyle(fontWeight: FontWeight.bold), 
        ), 
        centerTitle: true, 
        backgroundColor: Colors.teal[800], 
        elevation: 5, 
        actions: const [ 
          Padding( 
            padding: EdgeInsets.only(right: 12.0), 
            child: Icon(Icons.settings), 
          ) 
        ], 
      ), 
 
      // 📱 Body with Column, Row, Container, Text, Padding 
      body: Padding( 
        padding: const EdgeInsets.all(16.0), 
        child: Column( 
          children: [ 
 
            // 🖼 Profile Image Container 
            Container( 
              width: 120, 
              height: 120, 
              decoration: BoxDecoration( 
                color: Colors.teal[100], 
                shape: BoxShape.circle, 
                image: const DecorationImage( 
                  image: AssetImage('assets/images/images.jpg'), // Add image in assets 

                  fit: BoxFit.cover, 
                ), 
              ), 
            ), 
 
            const SizedBox(height: 16), 
 
            // 👤 Name Text 
            const Text( 
              'Mo Samir', 
              style: TextStyle( 
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
              ), 
            ), 
 
            const SizedBox(height: 8), 
 
            const Text( 
              'Computer Science Student | Flutter Enthusiast', 
              style: TextStyle(fontSize: 16, color: Colors.grey), 
            ), 
 
            const Divider(height: 30, thickness: 1.2), 
 
            // 📞 Info Row 
            Row( 
              children: [ 
                const Icon(Icons.email, color: Colors.teal), 
                const SizedBox(width: 10), 
                const Text( 
                  'mo.samir.sitponwala@gmail.com', 
                  style: TextStyle(fontSize: 16), 
                ), 
              ], 
            ), 
 
            const SizedBox(height: 12), 
 
            Row( 
              children: [ 
                const Icon(Icons.phone, color: Colors.teal), 
                const SizedBox(width: 10), 
                const Text( 
                  '+91 9157176747', 
                  style: TextStyle(fontSize: 16), 
                ), 
              ], 
            ), 
 
            const Spacer(), 
 
            // � Bottom Button Row 
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [ 
                ElevatedButton.icon( 
                  onPressed: () {}, 
                  icon: const Icon(Icons.message), 
                  label: const Text('Message'), 
                ), 
                OutlinedButton.icon( 
                  onPressed: () {}, 
                  icon: const Icon(Icons.call), 
                  label: const Text('Call'), 
                ), 
              ], 
            ) 
          ], 
        ), 
      ), 
    ); 
  } 
}