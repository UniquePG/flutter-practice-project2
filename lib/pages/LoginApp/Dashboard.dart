import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Text(
          "Dashboard",
          style: TextStyle(fontSize: 40, color: Colors.red),
        ),
        color: Colors.amber,
      ),
    );
  }
}
