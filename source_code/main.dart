import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'phone_no.dart';
import 'email.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(headlineMedium: TextStyle(fontSize: 51)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => HomePage();
}

class HomePage extends State<MyHomePage> {
  static const String keyLogin = "login";
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/screen/splash.mp4')
      ..initialize().then((_) {
        setState(() {}); // When your video has been initialized, update the UI
        Timer(Duration(seconds: 2), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PhoneNumberInputPage(),
              ));
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : CircularProgressIndicator(), // Show a loading indicator while the video is loading
    ));
  }
}

