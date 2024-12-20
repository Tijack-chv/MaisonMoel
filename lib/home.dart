import 'package:flutter/material.dart';
import 'package:maison_moel/accueil.dart';
import 'package:maison_moel/appbar.dart';
import 'package:maison_moel/connexion.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final controller = PageController(initialPage: 1);
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar_Principal(title: widget.title,),
      body: const Column(),

    );
  }
}
