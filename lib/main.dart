import 'package:eat/features/auth/view/login_view.dart';
import 'package:eat/features/auth/view/singup_view.dart';
import 'package:eat/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SingUpView(), debugShowCheckedModeBanner: false);
  }
}
