import 'dart:convert';

List<LoginData> loginDataFromJson(String str) =>
List<LoginData>.from(json.decode(str).map((x) => LoginData.fromJson(x)));

String loginDataToJson(List<LoginData> data) =>
json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginData {
  int idPersonne;
  String email;
  String prenom;
  String nom;

  LoginData({required this.idPersonne, required this.email, required this.prenom, required this.nom});

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
      idPersonne: json["idPersonne"],
      email: json["email"],
      prenom: json["prenom"],
      nom: json["nom"],
  );

  Map<String, dynamic> toJson() => {
    'idPersonne': idPersonne,
    'email': email,
    'prenom': prenom,
    'nom': nom,
  };
}