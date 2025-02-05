import 'package:flutter/material.dart';
import 'package:maison_moel/data/Commande.dart';
import 'package:maison_moel/data/Plat.dart';
import 'package:intl/intl.dart';

void bottomSheetInfoPlat(BuildContext context, Plat plat) {
  String alergenes = '';
  for (int i = 0; i < plat.alergenes.length; i++) {
    alergenes += plat.alergenes[i].descriptionAlergenes.replaceFirst(plat.alergenes[i].descriptionAlergenes[0], plat.alergenes[i].descriptionAlergenes[0].toUpperCase());;
    if (i != plat.alergenes.length - 1) {
      alergenes += ', ';
    }
  }

  showModalBottomSheet(
    backgroundColor: const Color(0xFF323232),
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Text(
                            'Type:',
                            style: const TextStyle(
                              color: Color(0xFFFFEB99),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            plat.type.replaceFirst(plat.type[0], plat.type[0].toUpperCase()),
                            style: const TextStyle(
                              color: Color(0xFFFFEB99),
                              fontSize: 20,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            plat.alergenes.length > 1 ? 'Alergènes: ' : 'Alergène: ',
                            style: const TextStyle(
                              color: Color(0xFFFFEB99),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            alergenes,
                            style: const TextStyle(
                              color: Color(0xFFFFEB99),
                              fontSize: 20,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ),
        ),
      );
    }
  );
}

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
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Date : ${DateFormat("dd/MM/yyyy 'à' HH:mm").format(DateTime.parse(commande.date))}",
                      style: const TextStyle(
                        color: Color(0xFFFFEB99),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                commande.plats.isEmpty ? const ListTile(
                  shape: const Border(
                    bottom: BorderSide(
                      color: Color(0xFFFFEB99),
                      width: 0.5,
                    ),
                  ),
                  title: Text(
                    "Pas de plats",
                    style: const TextStyle(
                      color: Color(0xFFFFEB99),
                      fontSize: 18,
                    ),
                  ),
                  textColor: const Color(0xFFFFEB99),
                  tileColor: const Color(0xFF292929),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ) : const SizedBox(),
                for (var plat in commande.plats)
                  ListTile(
                    shape: const Border(
                      top: BorderSide(
                        color: Color(0xFFFFEB99),
                        width: 0.5,
                      ),
                    ),
                    subtitle: Text(
                    '${plat.prix*plat.nb_commande}€',
                    ),
                    leading: plat.imagePlat.isNotEmpty ? Image.network(
                      'http://192.168.143.9:8080/${plat.imagePlat}',
                      width: 50,
                      height: 50,
                    ) : const Icon(Icons.image),
                    title: Text(
                      plat.nomPlat,
                      style: const TextStyle(
                        color: Color(0xFFFFEB99),
                        fontSize: 18,
                      ),
                    ),
                    trailing: Text(
                      plat.nb_commande.toString(),
                      style: const TextStyle(
                        color: Color(0xFFFFEB99),
                        fontSize: 18,
                      ),
                    ),
                    textColor: const Color(0xFFFFEB99),
                    tileColor: const Color(0xFF292929),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  ),
              ],
            ),
          ),
        ),
      );
    },
  );
}