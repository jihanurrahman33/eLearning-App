import 'package:elearning_ui/utils/config.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  String timeOfDayMessage = '';

  @override
  void initState() {
    super.initState();
    timeOfDayMessage = getTimeOfDayMessage();
  }

  String getTimeOfDayMessage() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return 'Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Evening';
    } else {
      return 'Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 15),
      width: size.width,
      height: size.height * 0.28,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, Color.fromARGB(255, 82, 47, 234)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello,',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Good $timeOfDayMessage!',
                    style: TextStyle(
                        color: Colors.white.withOpacity(.5),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const InkWell(
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1.5,
                            ),
                            shape: BoxShape.circle),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
            child: TextFormField(
              // textAlign:
              //     TextAlign.start, // Ensure text starts from the left
              textAlignVertical:
                  TextAlignVertical.center, // Center the hint text vertically
              decoration: InputDecoration(
                hintText: 'Search your topic',
                hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
                border: InputBorder.none,
                suffixIcon: const Icon(
                  Icons.mic,
                  color: AppColors.primaryColor,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10), // Adjust vertical padding
              ),
            ),
          ),
        ],
      ),
    );
  }
}
