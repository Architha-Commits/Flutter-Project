class OnboardModel {
  String header;
  String imagePath;
  String body;

  OnboardModel(
      {required this.header, required this.imagePath, required this.body});
}

List<OnboardModel> screens = [
  OnboardModel(
      header: "Proven\n Specialists",
      imagePath: "assets/images/Illustration.png",
      body: "We check each specialist before\n he starts work"),
  OnboardModel(
      header: "Honest\n Ratings",
      imagePath: "assets/images/Illustration1.png",
      body: "We carefully check each specialist\n and put honest"),
  OnboardModel(
      header: "insured\n order",
      imagePath: "assets/images/Illustration2.png",
      body: "We ensure each order for the\n amount of 500"),
  OnboardModel(
      header: "create\n order",
      imagePath: "assets/images/Illustration3.png",
      body: "It's easy just click on the plus")
];
