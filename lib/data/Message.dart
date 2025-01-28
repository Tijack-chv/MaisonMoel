class Message {
  final String message;
  final String nom;
  final String token;
  final String date;

  Message({
    required this.message,
    required this.token,
    required this.nom,
    required this.date,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'] ?? "",
      token: json['personne']['token'] ?? "",
      date: json['date'] ?? "",
      nom: json['personne']['prenom'] + " " + json['personne']['nom'] ?? "",
    );
  }
}