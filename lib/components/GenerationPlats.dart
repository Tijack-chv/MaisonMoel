import 'package:flutter/material.dart';
import 'package:maison_moel/data/services/Api.dart';

Widget generatePlats(int type, String token) {
  return FutureBuilder(
    future: API.getPlats(type, token),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return const Center(child: Text("Erreur de chargement des plats"));
      } else if (!snapshot.hasData || snapshot.data['plats'] == null) {
        return const Center(child: Text("Aucun plat disponible"));
      } else {
        var plats = snapshot.data['plats'];
        return Column( // Utilisation de Column pour contenir tous les éléments
          children: [
            for (var plat in plats) Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  plat['nomPlat'],
                  style: TextStyle(
                    color: Color(0xFFFFEB99),
                    fontSize: 18
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                        size: 30,
                      ),
                      onPressed: () {

                      },
                    ),
                    Text(
                      '0',
                      style: TextStyle(
                        color: Color(0xFFFFEB99),
                        fontSize: 30
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.green,
                        size: 30,
                      ),
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      }
    },
  );
}