import 'package:flutter/material.dart';
import 'package:my_app/screens/onboarding_screen.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily:"Inter",
      ),
      home: OnboardingScreen(),
    );
  }
}