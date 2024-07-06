import 'package:elearning_ui/data/dummy_course_data.dart';
import 'package:elearning_ui/screens/course_details/course_details.dart';
import 'package:elearning_ui/utils/config.dart';
import 'package:flutter/material.dart';

class CategoryCourses extends StatelessWidget {
  final String courseTitle;
  const CategoryCourses({super.key, required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(courseTitle),
      ),
      body: GridView.builder(
        itemCount: courses.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => CourseDetails(index: index)));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(.1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 5,
                        spreadRadius: .3)
                  ]),
              //padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              height: size.height * .2,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    courses[index].courseImage,
                    height: 80,
                  ),
                  Text(
                    textAlign: TextAlign.start,
                    courses[index].courseTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(courses[index].coursePrice),
                      Text(courses[index].authorName),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Rating:${courses[index].courseRating}'),
                      Text('Duration:${courses[index].courseDuration}'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
