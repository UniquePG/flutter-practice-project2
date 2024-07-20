import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:self_practice/pages/WallpaperApp/FullScreen.dart';

class HomeWallpaper extends StatefulWidget {
  const HomeWallpaper({super.key});

  State<HomeWallpaper> createState() => _HomewallpaperState();
}

class _HomewallpaperState extends State<HomeWallpaper> {
  List images = [];
  int page = 1;

  @override
  void initState() {
    super.initState();

    fetchPhotos();
  }

  void fetchPhotos() async {
    var res = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=80,"),
        headers: {
          'Authorization':
              'QGAVGwNPg40yRFbib6hS8jfcwcGueyXTbZD4bk9a3UtdyEuMlj4Udt36'
        }).then((value) {
      // print(value.body)

      Map result = jsonDecode(value.body);

      setState(() {
        images = result['photos'];
      });

      print(images);
    });
  }

  void loadMore() async {
    setState(() {
      page = page + 1;
    });

    String uri =
        "https://api.pexels.com/v1/curated?per_page=80&page=" + page.toString();

    var res = await http.get(Uri.parse(uri), headers: {
      'Authorization':
          'QGAVGwNPg40yRFbib6hS8jfcwcGueyXTbZD4bk9a3UtdyEuMlj4Udt36'
    }).then((value) {
      Map result = jsonDecode(value.body);

      setState(() {
        images.addAll(result["photos"]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpaper App"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: GridView.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullScreen(
                                  imgUrl: images[index]['src']['large2x'])));
                    },
                    child: Hero(
                      tag: "image",
                      child: Container(
                        color: Colors.green,
                        child: Image.network(
                          images[index]['src']['tiny'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          )),
          InkWell(
            onTap: () {
              loadMore();
            },
            child: Container(
              child: const Text(
                "Load More...",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
