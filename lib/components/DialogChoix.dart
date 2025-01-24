import 'package:flutter/material.dart';
import 'package:maison_moel/data/services/Api.dart';
import 'package:maison_moel/components/GenerationPlats.dart';

void ChoixDialog(BuildContext context, int type, String token) {
  String strType = "";
  if (type == 1) {
    strType = "Entrées";
  } else if (type == 2) {
    strType = "Plats";
  } else if (type == 3) {
    strType = "Desserts";
  } else if (type == 4) {
    strType = "Boissons";
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Color(0xFF292929),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  strType,
                  style: const TextStyle(
                    fontSize: 40,
                    color: Color(0xFFFFEB99),
                    fontFamily: 'LibreBaskerville'
                  )
                ),
              ),
              SingleChildScrollView(
                child: generatePlats(type, token),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Sauvegarder',
                  style: TextStyle(
                    color: Color(0xFFFFEB99),
                    fontSize: 25
                  ),
                ),
              ),
            ],
          ),
        )
      );
    }
  );
}