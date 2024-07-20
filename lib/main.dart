import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_practice/pages/CartApp/CartProvider.dart';
import 'package:self_practice/pages/HomePage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Self Practice Projects",
        theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 231, 146, 209),
            textTheme: const TextTheme(
              displayMedium: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
              displaySmall: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 167, 163, 163)),
            )),
        home: const HomePage(),
      ),
    );
  }
}
