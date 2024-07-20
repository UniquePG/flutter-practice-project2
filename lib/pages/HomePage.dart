import 'package:flutter/material.dart';
import 'package:self_practice/pages/CartApp/CartApp.dart';
import 'package:self_practice/pages/LoginApp/Login.dart';
import 'package:self_practice/pages/WallpaperApp/HomeWallpaper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => Scaffold(
              appBar: AppBar(title: const Text('Home Page')),
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CartApp()));
                        },
                        child: const Text("Cart Design")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: Text("Login Screen")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => HomeWallpaper()),
                          );
                        },
                        child: Text("Wallpaper App"))
                  ],
                ),
              ),
            ));
  }
}
