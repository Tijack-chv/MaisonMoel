import 'package:flutter/material.dart';
import 'package:maison_moel/components/appbar.dart';
import 'package:maison_moel/view/confirmation_commande.dart';
import 'package:maison_moel/view/connexion.dart';
import 'package:maison_moel/components/PlatsWidget.dart';
import 'package:maison_moel/data/Plat.dart';
import 'package:maison_moel/data/services/Api.dart';

class Commande extends StatefulWidget {
  const Commande({super.key, required this.title, required this.token, this.plats});
  final String title;
  final String token;
  final Map<Plat, int>? plats;

  @override
  State<Commande> createState() => _Commande();
}

class _Commande extends State<Commande> {
  final controller = PageController(initialPage: 1);
  int selectedIndex = 0;
  List<String> options = ['Entrées', 'Plats', 'Desserts', 'Boissons'];
  Widget widgets = const Text("data");
  late Map<Plat, int> listPlats;

  Widget PlatsWidget(int index, String token) {
    return FutureBuilder<List<Plat>>(
      future: API.getPlats(index, token),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Aucun plat disponible.'));
        } else {
          List<Plat> plats = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: plats.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              Plat plat = plats[index];
              return ListTile(
                shape: const Border(
                  bottom: BorderSide(
                    color: Color(0xFFFFEB99),
                    width: 0.5,
                  ),
                ),
                leading: plat.imagePlat.isNotEmpty ? Image.network(
                  'http://192.168.143.9:8080/${plat.imagePlat}',
                  width: 50,
                  height: 50,
                ) : const Icon(Icons.image),
                title: Wrap(
                  spacing: 5,
                  children: [
                    Text('${plat.nomPlat}'),
                    if (plat.type == '') const Icon(Icons.eco, color: Colors.green),
                  ],
                ),
                subtitle: Text("Stock : ${plat.quantite}"),
                trailing: IconButton(
                  icon: const Icon(Icons.add_circle),
                  color: Colors.green,
                  iconSize: 30,
                  onPressed: () {
                    addPlat(plat, plat.quantite);
                  },
                ),
                textColor: const Color(0xFFFFEB99),
                tileColor: const Color(0xFF292929),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              );
            },
          );
        }
      },
    );
  }

  void GeneratePlats(int index) {
    setState(() {
      widgets = PlatsWidget(index+1, widget.token);
    });
  }

  void addPlat(Plat plat, int quantite) {
    setState(() {
      if (listPlats.containsKey(plat)) {
        if (listPlats[plat]! < quantite) {
          listPlats[plat] = listPlats[plat]! + 1;
        }
      } else {
        if (quantite > 0) {
          listPlats[plat] = 1;
        }
      }
      print(listPlats);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    listPlats = widget.plats ?? {};
    GeneratePlats(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323232),
      appBar: Appbar_Principal(title: widget.title),
      body: ListView(
        padding: const EdgeInsets.only(top: 16.0),
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(options.length, (index) {
              return ChoiceChip(
                side: const BorderSide(
                  color: Color(0xFFFFEB99),
                  width: 0.5,
                ),
                label: Text(options[index]),
                selected: selectedIndex == index,
                onSelected: (isSelected) {
                  setState(() {
                    selectedIndex = index;
                    GeneratePlats(index);
                  });
                },
                selectedColor: Color(0xFFFFEB99),
                backgroundColor: Color(0xFF292929),
                labelStyle: TextStyle(
                  color: selectedIndex == index
                      ? Color(0xFF292929)
                      : Color(0xFFFFEB99),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          widgets,
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left:40, right: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF292929),
                side: const BorderSide(
                  color: Color(0xFFFFEB99),
                  width: 0.5,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommandeConfirmation(title: 'Confirmation', token: widget.token, plats: listPlats),
                  ),
                );
              },
              child: const Text('Confirmer la commande'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
