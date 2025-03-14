import 'package:flutter/material.dart';
import 'package:maison_moel/components/appbar.dart';
import 'package:maison_moel/view/scanner/code_scanner.dart';
import 'package:maison_moel/view/prendre_commande/commande.dart';
import 'package:maison_moel/view/info_commande/commande_state.dart';
import 'package:maison_moel/view/connexion/connexion.dart';
import 'package:maison_moel/view/communication/discussion.dart';
//import 'package:url_launcher/url_launcher.dart';

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
      body: Center(
        child:ListView(
          shrinkWrap: true,
          children: <Widget>[
            Image.asset(
              "assets/images/logo_t.png",
              height: MediaQuery.of(context).size.width * 0.6,
            ),

            const SizedBox(height: 20),

            const Text(
                'Application pour serveurs',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFFFFEB99),
                    fontFamily: 'LibreBaskerville'
                )
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Commande(title: 'Commande', token: widget.token),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFFFEB99), width: 0.5),
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
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scanner(title: 'Scanner', token: widget.token),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFFFEB99), width: 0.5),
                    color: Color(0xFF292929),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const Column(
                    children: [
                      Text(
                        'Scanner un réservation',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFFFEB99),
                          fontFamily: 'LibreBaskerville'
                        )
                      ),
                    ],
                  ),
                )
              )
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Discussion(title: 'Discussion', token: widget.token),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFFFEB99), width: 0.5),
                    color: Color(0xFF292929),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const Column(
                    children: [
                      Text(
                          'Communication cuisine',
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
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommandeState(title: 'Commandes', token: widget.token),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFFFEB99), width: 0.5),
                    color: Color(0xFF292929),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const Column(
                    children: [
                      Text(
                          'Voir les commandes',
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
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
