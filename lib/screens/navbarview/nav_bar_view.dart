import 'package:elearning_ui/screens/home_screen/home_screen.dart';
import 'package:elearning_ui/screens/learning/learning.dart';
import 'package:elearning_ui/screens/settings/settings.dart';
import 'package:elearning_ui/screens/wishlist/wishlist.dart';
import 'package:elearning_ui/utils/config.dart';
import 'package:flutter/material.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const Learning(),
    const Wishlist(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        // type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.star),
            icon: Icon(Icons.star_border),
            label: 'Featured',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.play_circle),
            icon: Icon(Icons.play_circle_outline),
            label: 'Learning',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            // activeIcon: Icon(Icons.settings_applications),
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
