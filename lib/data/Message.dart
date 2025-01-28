class Message {
  final String message;
  final String token;
  final String date;

  Message({
    required this.message,
    required this.token,
    required this.date,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'] ?? "",
      token: json['token'] ?? "",
      date: json['date'] ?? "",
    );
  }
}