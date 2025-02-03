import 'package:flutter/material.dart';
import 'package:maison_moel/data/services/Api.dart';
import 'package:maison_moel/view/scanner/code_scanner.dart';



void afficheDialogQRCode(BuildContext context, String reponse, String nom, String date, String id, VoidCallback onClose) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF323232),
        title: reponse.contains('confirmée') ? const Icon(Icons.check_circle, color: Colors.green, size: 50) : const Icon(Icons.cancel, color: Colors.red, size: 50),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              reponse.contains('confirmée') && nom != '' ? 'Nom : $nom' : reponse,
              style: const TextStyle(
                color: Color(0xFFFFEB99),
                fontSize: 16,
              ),
            ),

            if (reponse.contains('confirmée') && date != '') const SizedBox(height: 10),
            if (reponse.contains('confirmée') && date != '') Text(
              'Date : $date',
              style: const TextStyle(
                color: Color(0xFFFFEB99),
                fontSize: 16,
              ),
            ),
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