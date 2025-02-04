import 'package:flutter/material.dart';
import 'package:maison_moel/components/appbar.dart';
import 'package:maison_moel/components/DemandeTable.dart';
import 'package:maison_moel/view/connexion/connexion.dart';
import 'package:maison_moel/data/Plat.dart';
import 'package:maison_moel/data/services/Api.dart';


class CommandeConfirmation extends StatefulWidget {
  const CommandeConfirmation({super.key, required this.title, required this.token, required this.plats});
  final String title;
  final String token;
  final Map<Plat, int> plats;

  @override
  State<CommandeConfirmation> createState() => _CommandeConfirmation();
}

class _CommandeConfirmation extends State<CommandeConfirmation> {
  final controller = PageController(initialPage: 1);

  void updatePlats(Plat plat, int quantity) {
    setState(() {
      if (quantity <= 0) {
        widget.plats.remove(plat);
      } else {
        if (quantity <= plat.quantite) {
          widget.plats[plat] = quantity;
        }
      }
    });
  }

  void submitCommande() {
    demandeTable(context, widget.plats, widget.token);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323232),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFFFEB99)),
        titleTextStyle: const TextStyle(
          color: Color(0xFFFFEB99),
          fontSize: 22,
        ),
        title: Text(
          widget.title,
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(3.0),
            child: Container(
              color: Color(0xFFFFEB99),
              height: 2.0,
            )
        ),
        backgroundColor: Color(0xFF292929),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 16.0),
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              if (widget.plats.isEmpty)
                const Center(
                  child: Text(
                    'Aucun plat sélectionné',
                    style: TextStyle(
                      color: Color(0xFFFFEB99),
                      fontSize: 18,
                    ),
                  ),
                ),
              for (var plat in widget.plats.entries)
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(
                      color: Color(0xFFFFEB99),
                      width: 0.5,
                    ),
                  ),
                  leading: plat.key.imagePlat.isNotEmpty ? Image.network(
                    'http://192.168.143.9:8080/${plat.key.imagePlat}',
                    width: 50,
                    height: 50,
                  ) : const Icon(Icons.image),
                  title: Text('${plat.key.nomPlat} - ${plat.value}x'),
                  subtitle: Text('${plat.value*plat.key.prix}€'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle, color: Colors.red,
                          size: 30,
                        ),
                        color: Colors.red,
                        onPressed: () {
                         updatePlats(plat.key, plat.value - 1);
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle, color: Colors.green,
                          size: 30,
                        ),
                        color: Colors.green,
                        onPressed: () {
                          updatePlats(plat.key, plat.value + 1);
                        },
                      ),
                    ],
                  ),
                  textColor: const Color(0xFFFFEB99),
                  tileColor: const Color(0xFF292929),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
            ],
          ),
          const SizedBox(height: 20),
          ListTile(
            tileColor: const Color(0xFF292929),
            shape: const Border(
              top: BorderSide(
                color: Color(0xFFFFEB99),
                width: 0.5,
              ),
              bottom: BorderSide(
                color: Color(0xFFFFEB99),
                width: 0.5,
              ),
            ),
            title: Center(
              child: Text(
                'Total : ${widget.plats.entries.fold(0.0, (previousValue, element) => previousValue + element.key.prix * element.value)}€',
                style: const TextStyle(
                  color: Color(0xFFFFEB99),
                  fontSize: 18,
                )
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left:40, right: 40, bottom: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF292929),
                side: const BorderSide(
                  color: Color(0xFFFFEB99),
                  width: 0.5,
                ),
              ),
              onPressed: () {
                if (widget.plats.isNotEmpty) {
                  submitCommande();
                }
              },
              child: Text(
                'Confirmer la commande',
                style: TextStyle(
                  color: widget.plats.isEmpty ? Colors.grey : Color(0xFFFFEB99),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
