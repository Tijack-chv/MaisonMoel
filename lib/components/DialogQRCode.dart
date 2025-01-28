import 'package:flutter/material.dart';
import 'package:maison_moel/view/code_scanner.dart';

void afficheDialogQRCode(BuildContext context, String nom, String date, String id, VoidCallback onClose) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF323232),
        title: const Text(
          'Vérification',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFFFEB99),
            fontSize: 18,
            fontFamily: 'LibreBaskerville',
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[


            const SizedBox(height: 10),
            Text(
              'Nom : $nom',
              style: const TextStyle(
                color: Color(0xFFFFEB99),
                fontSize: 16,
              ),
            ),


            const SizedBox(height: 10),
            Text(
              'Date : $date',
              style: const TextStyle(
                color: Color(0xFFFFEB99),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () {
                onClose();
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF292929)),
                side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Color(0xFFFFEB99))),
              ),
              child: const Text(
                'Fermer',
                style: TextStyle(
                  color: Color(0xFFFFEB99),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}