import 'package:flutter/material.dart';
import 'package:maison_moel/accueil.dart';
import 'package:maison_moel/appbar.dart';
import 'package:maison_moel/commande.dart';
import 'package:maison_moel/connexion.dart';
import 'package:maison_moel/components/DialogChoix.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.token});
  final String title;
  final String token;

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
      backgroundColor: Color(0xFF323232),
      appBar: Appbar_Principal(title: widget.title,),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 10),
          Card(
            color: Color(0xFF292929),
            elevation: 5,
            shadowColor: Colors.white30,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF292929),
              ),
              padding: const EdgeInsets.all(20),
              child: const Column(
                children: [
                  Text(
                    'Application pour les serveurs',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFFEB99),
                        fontFamily: 'LibreBaskerville'
                    )
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Commande(title: 'Commande', token: widget.token),
                ),
              );
            },
            child: Card(
              color: Color(0xFF292929),
              elevation: 5,
              shadowColor: Colors.white30,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF292929),
                ),
                padding: const EdgeInsets.all(20),
                child: const Column(
                  children: [
                    Text(
                        'Prendre un commande',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFFFEB99),
                            fontFamily: 'LibreBaskerville'
                        )
                    ),
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
