import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          height: 400,
          width: 400,
          color: Colors.red,
          child: const Text('I am first container'),
        ),
        Positioned(
            bottom: -20,
            right: 150,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.amber,
              child: const Text('I am second '),
            )),

        // Positioned(
        // bottom:-20,
        // right: 1,
        // child: Container(
        //   height: 100,
        //   width: 100,
        //   color: Colors.amber,
        //   child: const Text('I am second '),
        // )

        // ),
      ],
    )));
  }
}
