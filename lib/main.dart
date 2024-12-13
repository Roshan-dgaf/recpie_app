import 'package:flutter/material.dart';
import 'package:recpie_app/Screen/registration_screen.dart';
import 'package:recpie_app/app_utils.dart';
import 'package:recpie_app/widgets/input_field_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RegistrationScreen(),
      // home: const MyWidget(),
    );
  }
}