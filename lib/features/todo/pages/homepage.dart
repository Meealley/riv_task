import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home Page of riverpod todo",
          style: TextStyle(fontSize: 32, color: Colors.purple),
        ),
      ),
    );
  }
}
