class CourseDetailsModel {
  final String courseTitle;
  final String coursePrice;
  final double courseRating;
  final int courseDuration;
  final String authorName;
  final int noOfVideo;
  final String description;
  final String courseImage;

  const CourseDetailsModel({
    required this.courseImage,
    required this.courseTitle,
    required this.coursePrice,
    required this.courseRating,
    required this.courseDuration,
    required this.authorName,
    required this.noOfVideo,
    required this.description,
  });
}
