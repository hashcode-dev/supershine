import 'package:flutter/material.dart';
import 'package:supershine/widgets/page_view.dart';

import 'integration/image_resource_integration.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tutorial',
      home: SuperShineHome(),
    ),
  );
}

class SuperShineHome extends StatelessWidget {
  const SuperShineHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
                  'Super Shine',
                  style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0
      ),
      // body is the majority of the screen.
      body: const HomeScreenPageView()
    );
  }
}