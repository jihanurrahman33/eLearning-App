import 'package:elearning_ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // // darkTheme: ThemeData.dark().copyWith(
      // //   colorScheme: ColorScheme.fromSeed(
      // //     seedColor: Colors.indigo,
      // //     brightness: Brightness.dark,
      //   ),
      // ),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
      home: const OnboardingScreen(),
    );
  }
}
