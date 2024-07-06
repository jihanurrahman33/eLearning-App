import 'package:elearning_ui/data/course_data.dart';
import 'package:elearning_ui/screens/home_screen/widget/custom_gridView.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: CustomGridview(count: availableCategories.length),
        ),
      ),
    );
  }
}
