class LoginData {
  int idPersonne;
  String email;
  String prenom;
  String nom;

  LoginData(this.idPersonne, this.email, this.prenom, this.nom);

  LoginData.fromJson(Map<String, dynamic> json) :
        idPersonne = json['idPersonne'],
        email = json['email'],
        prenom = json['prenom'],
        nom = json['nom'];

  Map<String, dynamic> toJson() => {
    'idPersonne': idPersonne,
    'email': email,
    'prenom': prenom,
    'nom': nom,
  };
}