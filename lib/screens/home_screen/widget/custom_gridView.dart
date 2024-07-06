import 'package:elearning_ui/data/course_data.dart';

import 'package:elearning_ui/screens/category_courses/category_courses.dart';

import 'package:flutter/material.dart';

class CustomGridview extends StatefulWidget {
  const CustomGridview({super.key, required this.count});
  final int count;

  @override
  State<CustomGridview> createState() => _CustomGridviewState();
}

class _CustomGridviewState extends State<CustomGridview> {
  @override
  Widget build(BuildContext context) {
    final int count = widget.count;
    return GridView.builder(
      itemCount: count,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const CategoryCourses(
                  courseTitle: 'Courses',
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: .3,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // alignment: Alignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Image.asset(
                    availableCategories[index].image,
                    width: 150,
                    height: 110,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        availableCategories[index].title,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        'Courses: ${availableCategories[index].noOfCourse}',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
