class Alergene {
  final int idAlergenes;
  final String descriptionAlergenes;

  Alergene({
    required this.idAlergenes,
    required this.descriptionAlergenes,
  });

  factory Alergene.fromJson(Map<String, dynamic> json) {
    return Alergene(
      idAlergenes: json['idAlergenes'] ?? 0,
      descriptionAlergenes: json['descriptionAlergenes'] ?? '',
    );
  }
}