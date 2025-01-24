import 'package:flutter/material.dart';
import 'package:maison_moel/accueil.dart';
import 'package:maison_moel/appbar.dart';
import 'package:maison_moel/connexion.dart';
import 'package:maison_moel/components/DialogChoix.dart';

class Commande extends StatefulWidget {
  const Commande({super.key, required this.title, required this.token});
  final String title;
  final String token;

  @override
  State<Commande> createState() => _Commande();
}

class _Commande extends State<Commande> {
  final controller = PageController(initialPage: 1);

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292929),
      appBar: Appbar_Principal(title: widget.title,),

    );
  }
}
