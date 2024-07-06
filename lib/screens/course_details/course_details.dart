import 'package:elearning_ui/data/course_data.dart';
import 'package:elearning_ui/data/dummy_course_data.dart';
import 'package:elearning_ui/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CourseDetails extends StatefulWidget {
  final int index;
  const CourseDetails({super.key, required this.index});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        //_controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_left),
          iconSize: 40,
          color: AppColors.primaryColor,
        ),
        title: Text(
          textAlign: TextAlign.center,
          availableCategories[0].title,
          style: const TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: size.height * .25,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 5,
                      spreadRadius: .5),
                ],
              ),
              child: _controller.value.isInitialized
                  ? const Icon(Icons.play_arrow_rounded)
                  // ? AspectRatio(
                  //     aspectRatio: _controller.value.aspectRatio,
                  //     child: VideoPlayer(_controller),
                  //   )
                  : const Center(
                      child: Text('Please Wait...'),
                    ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  courses[widget.index].courseTitle,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Description',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(courses[widget.index].description),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
