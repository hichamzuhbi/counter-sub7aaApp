import 'package:flutter/material.dart';
import 'package:rosaryapp/homeScreen.dart';

void main(){
  runApp(const Sub7a());
}
class Sub7a extends StatelessWidget {
  const Sub7a({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}