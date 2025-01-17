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
      backgroundColor: Colors.white,
      appBar: Appbar_Principal(title: widget.title,),
      body: ListView(
        children: const <Widget>[
          ExpansionTile(
            title: Text(
                'Entrée',
              style: TextStyle(color: Colors.black),
            ),
            children: <Widget>[
              ListTile(
                title: Text('Contenu de la section 1'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Plat',
              style: TextStyle(color: Colors.black),
            ),
            children: <Widget>[
              ListTile(
                title: Text('Contenu de la section 2'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Dessert',
              style: TextStyle(color: Colors.black),
            ),
            children: <Widget>[
              ListTile(
                title: Text('Contenu de la section 3'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Boisson',
              style: TextStyle(color: Colors.black),
            ),
            children: <Widget>[
              ListTile(
                title: Text('Contenu de la section 3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
