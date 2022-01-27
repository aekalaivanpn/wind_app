import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
    runApp(const VideoApp());
}

class VideoApp extends StatelessWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
