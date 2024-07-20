import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  final String imgUrl;
  const FullScreen({super.key, required this.imgUrl});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  setWallpaper() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: Hero(
                tag: "image",
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            )),
            InkWell(
              onTap: () {},
              child: Container(
                child: const Text(
                  "Set wallpaper",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
