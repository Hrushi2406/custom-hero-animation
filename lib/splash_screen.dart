import 'dart:async';

import 'package:flutter/material.dart';

import 'music_home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _height = 1000;

  final Duration _animationDuration = const Duration(milliseconds: 450);

  final image = Image.network(
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/nature-black-%26-white-cd-album-cover-template-design-999ee29814207dd926db4181f53332f4_screen.jpg?ts=1596983659',
  );

  @override
  void didChangeDependencies() {
    //To load image ahead of time
    precacheImage(image.image, context);
    super.didChangeDependencies();
  }

  _changeheight() {
    setState(() {
      _height = 0;
    });

    Timer(_animationDuration, () {
      _navigate();
    });
  }

  _navigate() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 350),
        pageBuilder: (_, Animation<double> animation, __) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 1),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                curve: Curves.fastOutSlowIn,
                parent: animation,
              ),
            ),
            child: const MusicHomeScreen(),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    Timer(const Duration(milliseconds: 750), () {
      _changeheight();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: AnimatedContainer(
        width: double.infinity,
        height: _height,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        duration: _animationDuration,
        curve: Curves.fastOutSlowIn,
        child: Center(
          child: SizedBox(
            width: 200,
            child: Image.asset('assets/logo.png'),
          ),
        ),
      ),
    );
  }
}
