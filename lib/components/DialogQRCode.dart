import 'package:flutter/material.dart';
import 'package:maison_moel/code_scanner.dart';

void afficheDialogQRCode(BuildContext context, String nom, String date, VoidCallback onClose) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(

        backgroundColor: const Color(0xFF323232),
        title: const Text(
          'QR Code',
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
              'Nom: $nom',
              style: const TextStyle(
                color: Color(0xFFFFEB99),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Date: $date',
              style: const TextStyle(
                color: Color(0xFFFFEB99),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              onClose();
              Navigator.of(context).pop();
            },
            child: const Text(
              'Fermer',
              style: TextStyle(
                color: Color(0xFFFFEB99),
                fontSize: 16,
              ),
            ),
          ),
        ],
      );
    },
  );
}