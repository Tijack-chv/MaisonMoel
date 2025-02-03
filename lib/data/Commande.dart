import 'package:maison_moel/data/Plat.dart';

class Commande {
  final int idCommande;
  final String date;
  final String nomServeur;
  final String etat;
  final String nomReservation;
  final int numTable;
  final List<PlatInfo> plats;

  Commande({
    required this.idCommande,
    required this.date,
    required this.nomServeur,
    required this.etat,
    required this.nomReservation,
    required this.numTable,
    required this.plats,
  });

  factory Commande.fromJson(Map<String, dynamic> json) {
    return Commande(
      idCommande: json['idCommande'] ?? 0,
      date: json['dateCommande'] ?? '',
      nomServeur: json['serveur']['nom'] + json['serveur']['prenom'] ?? '',
      etat: json['etat']['libelleEtat'] ?? '',
      nomReservation: json['reservation']['client']['nom'] + json['reservation']['client']['prenom'] ?? '',
      numTable: json['reservation']['idTable'] ?? 0,
      plats: List<PlatInfo>.from(json['plats'].map((plat) => PlatInfo.fromJson(plat))),
    );
  }
}