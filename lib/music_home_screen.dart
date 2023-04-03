import 'dart:math';

import 'package:flutter/material.dart';

import 'music_details_screen.dart';

class MusicHomeScreen extends StatefulWidget {
  const MusicHomeScreen({Key? key}) : super(key: key);

  @override
  _MusicHomeScreenState createState() => _MusicHomeScreenState();
}

class _MusicHomeScreenState extends State<MusicHomeScreen> {
  final double inlineOffset = 20;

  navigate() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 5050),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: MusicDetailsScreen(),
          );
        },
      ),
    );
  }

  final image = Image.network(
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/nature-black-%26-white-cd-album-cover-template-design-999ee29814207dd926db4181f53332f4_screen.jpg?ts=1596983659',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Custom Hero Animation ',
          style: TextStyle(fontFamily: 'inter'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 200),
          GestureDetector(
            onTap: navigate,
            child: Center(
              child: Hero(
                tag: 'hero-container',
                flightShuttleBuilder: (flightContext, animation,
                    flightDirection, fromHeroContext, toHeroContext) {
                  final tween = Tween(
                    begin: 0.0,
                    end: 2.0,
                  );
                  final curvedAnimation = CurvedAnimation(
                    parent: animation,
                    curve: Curves.fastOutSlowIn,
                  );

                  final rotationAnimation = tween.animate(curvedAnimation);

                  return AnimatedBuilder(
                    animation: rotationAnimation,
                    builder: (context, child) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.003)
                          ..rotateX(
                            pi * rotationAnimation.value,
                          ),
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: image,
                        ),
                      );
                    },
                  );
                },
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.003)
                    ..rotateX(
                      pi * 0,
                    ),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 220,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: image,
                    ),
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

//SAFARI LIKE TAB BAr
  //final images = [Colors.blue, Colors.red, Colors.amber, Colors.black];
// SizedBox(
//   height: 700,
//   child: Stack(
//     alignment: Alignment.center,
//     children: List.generate(
//       4,
//       (index) {
//         return AnimatedPositioned(
//           top: 100 + (15.0 * index) + (_isExpanded ? 40 * index : 0),
//           curve: Curves.fastOutSlowIn,
//           duration: const Duration(milliseconds: 450),
//           child: TweenAnimationBuilder<double>(
//             tween:
//                 Tween<double>(begin: 0.0, end: _isExpanded ? 0 : 0),
//             curve: Curves.fastOutSlowIn,
//             duration: const Duration(milliseconds: 450),
//             builder:
//                 (BuildContext context, double? value, Widget? child) {
//               return Transform.translate(
//                 offset: Offset(
//                   0,
//                   value!,
//                 ),
//                 child: Transform.scale(
//                   scale: 1 - (0.05 * (1 - index)),
//                   alignment: Alignment.topCenter,
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _rotation = 0.1;
//                         _isExpanded = true;
//                       });
//                     },
//                     child: TweenAnimationBuilder<double>(
//                       tween: Tween<double>(
//                           begin: 0.0, end: _isExpanded ? 0.1 : 0),
//                       curve: Curves.fastOutSlowIn,
//                       duration: const Duration(milliseconds: 450),
//                       builder: (BuildContext context, double? value,
//                           Widget? child) {
//                         return Transform(
//                           transform: Matrix4.identity()
//                             ..setEntry(3, 2, 0.003)
//                             ..rotateX(value! * pi),
//                           child: Container(
//                             width: 200.0 + (15 * index),
//                             height: 200,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(16),
//                               color: images[index],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     ),
//   ),
// ),
