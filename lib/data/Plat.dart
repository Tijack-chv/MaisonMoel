import 'package:maison_moel/data/Alergene.dart';

class Plat {
  final int idPlat;
  final String nomPlat;
  final int quantite;
  final String imagePlat;
  final String description;
  final double prix;
  final String type;
  final List<Alergene> alergenes;

  Plat({
    required this.idPlat,
    required this.nomPlat,
    required this.quantite,
    required this.imagePlat,
    required this.description,
    required this.prix,
    required this.type,
    required this.alergenes,
  });

  factory Plat.fromJson(Map<String, dynamic> json) {
    return Plat(
      idPlat: json['idPlat'] ?? 0,
      nomPlat: json['nomPlat'] ?? '',
      quantite: json['quantite'] ?? 0,
      imagePlat: json['imagePlat'] ?? '',
      description: json['descriptionPlat'] ?? '',
      prix: (json['prixHT'] as num).toDouble(),
      type: json['type_plat']['libelleTypePlat'] ?? '',
      alergenes: List<Alergene>.from(json['alergenes'].map((alergene) => Alergene.fromJson(alergene))),
    );
  }
}

class PlatInfo {
  final int idPlat;
  final String nomPlat;
  final int quantite;
  final String imagePlat;
  final String description;
  final double prix;
  final int nb_commande;

  PlatInfo({
    required this.idPlat,
    required this.nomPlat,
    required this.quantite,
    required this.imagePlat,
    required this.description,
    required this.prix,
    required this.nb_commande,
  });

  factory PlatInfo.fromJson(Map<String, dynamic> json) {
    return PlatInfo(
      idPlat: json['idPlat'] ?? 0,
      nomPlat: json['nomPlat'] ?? '',
      quantite: json['quantite'] ?? 0,
      imagePlat: json['imagePlat'] ?? '',
      description: json['descriptionPlat'] ?? '',
      prix: (json['prixHT'] as num).toDouble(),
      nb_commande: json['nb_commande'] ?? 0,
    );
  }
}

