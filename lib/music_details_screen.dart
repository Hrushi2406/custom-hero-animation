import 'package:flutter/material.dart';

class MusicDetailsScreen extends StatelessWidget {
  MusicDetailsScreen({Key? key}) : super(key: key);

  final image = Image.network(
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/nature-black-%26-white-cd-album-cover-template-design-999ee29814207dd926db4181f53332f4_screen.jpg?ts=1596983659',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Hero(
            tag: 'hero-container',
            child: Center(
              child: Transform(
                transform: Matrix4.identity()..setEntry(3, 2, 0.003),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: image,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
