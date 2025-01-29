import 'package:flutter/material.dart';
import 'package:maison_moel/data/Commande.dart';

void bottomSheetInfoCommande(BuildContext context, Commande commande) {
  showModalBottomSheet(
    backgroundColor: const Color(0xFF323232),
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(height: 25),
                const Text(
                  'Commande',
                  style: TextStyle(
                    color: Color(0xFFFFEB99),
                    fontSize: 30,
                    fontFamily: 'LibreBaskerville',
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Table N°: ',
                      style: TextStyle(
                        color: Color(0xFFFFEB99),
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      commande.numTable.toString(),
                      style: const TextStyle(
                        color: Color(0xFFFFEB99),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Date : ${commande.date.substring(0,10)} ${commande.date.substring(11,16)}",
                      style: const TextStyle(
                        color: Color(0xFFFFEB99),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}