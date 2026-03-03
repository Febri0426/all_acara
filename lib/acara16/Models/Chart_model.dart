class ChartModel {
  final String name;
  final String message;
  final String time;
  final String profileUrl;

  ChartModel({
    required this.name,
    required this.message,
    required this.time,
    required this.profileUrl,
  });
}

// DATA DUMMY CHAT
List<ChartModel> items = [
  ChartModel(
    name: "Hilya",
    message: "Hello Hilya",
    time: "12.00",
    profileUrl:
    "https://img.icons8.com/color/96/000000/user.png",
  ),
  ChartModel(
    name: "Rizki",
    message: "Apa kabar?",
    time: "12.34",
    profileUrl:
    "https://img.icons8.com/color/96/000000/user.png",
  ),
  ChartModel(
    name: "Nanda",
    message: "Halo bro",
    time: "13.00",
    profileUrl:
    "https://img.icons8.com/color/96/000000/user.png",
  ),
];
