import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget
      child; // final hence child variable cannot be reassigned once initialized

  //Constructor
  //required... -> parameter must be provided when creating a BasePage
  //this.child -> child parameter must be provided when creating a BasePage
  //: super... -> calls the parent class i.e StatelessWidget to initialize the key for the widget
  const BasePage({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 235, 253, 255),
              Color.fromARGB(255, 235, 253, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        //safeArea -> To ensure the content doesn't overlap with these system elements
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
