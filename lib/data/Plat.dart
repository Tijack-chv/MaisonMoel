class Plat {
  final int idPlat;
  final String nomPlat;
  final int quantite;
  final String imagePlat;
  final String description;
  final double prix;
  final String type;

  Plat({
    required this.idPlat,
    required this.nomPlat,
    required this.quantite,
    required this.imagePlat,
    required this.description,
    required this.prix,
    required this.type,
  });

  factory Plat.fromJson(Map<String, dynamic> json) {
    return Plat(
      idPlat: json['idPlat'] ?? 0,
      nomPlat: json['nomPlat'] ?? '',
      quantite: json['quantite'] ?? 0,
      imagePlat: json['imagePlat'] ?? '',
      description: json['descriptionPlat'] ?? '',
      prix: (json['prixHT'] as num).toDouble(),
      type: json['type'] ?? '',
    );
  }
}

