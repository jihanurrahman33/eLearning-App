import 'package:elearning_ui/screens/navbarview/nav_bar_view.dart';
import 'package:elearning_ui/utils/config.dart';
import 'package:elearning_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  void _onGetStarted(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NavBarView()));
  }

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 41, 18, 144),
              AppColors.primaryColor,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Image.asset('assets/images/onbscr.png'),
            Container(
              height: size.height * 0.4,
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Discover your next skill.\nLearn anything you want!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Discover the thing you want to learn \nand grow with them.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                  CustomButton(
                    title: 'Get Started',
                    width: size.width * .4,
                    onTap: () {
                      _onGetStarted(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
