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
      backgroundColor: Color(0xFF292929),
      appBar: Appbar_Principal(title: widget.title,),
      body: ListView(
        children: const <Widget>[
          ExpansionTile(
            iconColor: Color(0xFFFFEB99),
            title: Text(
                'Entrée',
              style: TextStyle(color: Color(0xFFFFEB99)),
            ),
            children: <Widget>[
              ListTile(
                title: Text('Contenu de la section 1'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            iconColor: Color(0xFF292929),
            backgroundColor: Color(0xFFFFEB99),
            title: Text(
              'Entrée',
              style: TextStyle(color: Color(0xFF292929)),
            ),
            children: <Widget>[
              ListTile(
                title: Text('Contenu de la section 1'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
