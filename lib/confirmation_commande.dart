import 'package:flutter/material.dart';
import 'package:maison_moel/accueil.dart';
import 'package:maison_moel/appbar.dart';
import 'package:maison_moel/connexion.dart';
import 'package:maison_moel/components/PlatsWidget.dart';
import 'package:maison_moel/data/Plat.dart';
import 'package:maison_moel/data/services/Api.dart';

class CommandeConfirmation extends StatefulWidget {
  const CommandeConfirmation({super.key, required this.title, required this.token, required this.plats});
  final String title;
  final String token;
  final Map<Plat, int> plats;

  @override
  State<CommandeConfirmation> createState() => _CommandeConfirmation();
}

class _CommandeConfirmation extends State<CommandeConfirmation> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323232),
      appBar: Appbar_Principal(title: widget.title),
      body: ListView(
        padding: const EdgeInsets.only(top: 16.0),
        children: [
          Wrap(
            alignment: WrapAlignment.center, // Centrer les éléments
            spacing: 8.0, // Espace horizontal entre les chips
            runSpacing: 8.0, // Espace vertical entre les lignes
            children: [
              for (var plat in widget.plats.keys)
                Chip(
                  label: Text(plat.nomPlat),
                  onDeleted: () {
                    setState(() {
                      widget.plats.remove(plat);
                    });
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
