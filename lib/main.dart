import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const LearningApp());
}

class LearningApp extends StatelessWidget {
  const LearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: learningBlue),
        splashFactory: InkRipple.splashFactory,
      ),
      home: const HomeScreen(),
    );
  }
}
