import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            radius: 43,
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1682685797332-e678a04f8a64?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8",
            ),
          ),
          SizedBox(height: 20,),
          Text("kennedymutugi111@gmail.com", style: TextStyle(fontSize: 20, color: Colors.black12),
          ),
        SizedBox(height: 20,),
          Text("kennedymutugi111@gmail.com", style: TextStyle(fontSize: 20, color: Colors.black12),
          ),
          SizedBox(height: 20,),
          Text("kennedymutugi111@gmail.com", style: TextStyle(fontSize: 20, color: Colors.black12),)

        ],
      ),
    );
  }
}