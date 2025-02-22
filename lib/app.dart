import 'package:flutter/material.dart';
import 'package:masmech/start_screen.dart';
//import 'package:masmech/widgets/base_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
      home: StartScreen(),
    );
  }
  // @override
  // State<App> createState() {
  //   return _AppState();
  // }
}

// class _AppState extends State<App> {
//   var activeScreen = 'start-screen';

//   void switchScreen() {
//     setState(() {
//       activeScreen = 'start-screen';
//     });
//   }

//   @override
//   Widget build(context) {
//     Widget screenWidget = StartScreen(switchScreen);

//     if (activeScreen == 'start-screen') {
//       //screenWidget = const StartScreen(
//       // onLoginSelected: () => switchScreen('login-screen'),
//       // onRegisterSelected: () => switchScreen('register-screen'),
//       //);
//     }

//     if (activeScreen == 'login-screen') {
//       // screenWidget = LoginScreen(
//       //   onBackToStart: () => switchScreen('start-screen'),
//       // );
//     }

//     if (activeScreen == 'register-screen') {
//       // screenWidget = RegisterScreen(
//       //   onBackToStart: () => switchScreen('start-screen'),
//       // );
//     }

   
//   }
// }
