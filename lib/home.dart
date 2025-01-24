import 'package:flutter/material.dart';
import 'package:maison_moel/accueil.dart';
import 'package:maison_moel/appbar.dart';
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
      backgroundColor: Color(0xFF292929),
      appBar: Appbar_Principal(title: widget.title,),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF595959)
              ),
              onPressed: () {
                ChoixDialog(context, 1, widget.token);
              },
              child: const Text(
                  "Entrées",
                style: TextStyle(
                  fontSize: 20
                ),
              )
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF595959)
              ),
              onPressed: () {
                ChoixDialog(context, 2, widget.token);
              },
              child: const Text(
                "Plats",
                style: TextStyle(
                    fontSize: 20
                ),
              )
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF595959)
              ),
              onPressed: () {
                ChoixDialog(context, 3, widget.token);
              },
              child: const Text(
                "Desserts",
                style: TextStyle(
                    fontSize: 20
                ),
              )
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF595959)
              ),
              onPressed: () {
                ChoixDialog(context, 4, widget.token);
              },
              child: const Text(
                "Boissons",
                style: TextStyle(
                    fontSize: 20
                ),
              )
            )
          ],
        ),
      )
    );
  }
}
