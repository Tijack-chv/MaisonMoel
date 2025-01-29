import 'package:flutter/material.dart';
import 'package:maison_moel/components/appbar.dart';
import 'package:maison_moel/components/bottomSheetInfoCommande.dart';
import 'package:maison_moel/data/Commande.dart';
import 'package:maison_moel/view/confirmation_commande.dart';
import 'package:maison_moel/view/connexion.dart';
import 'package:maison_moel/components/PlatsWidget.dart';
import 'package:maison_moel/data/Plat.dart';
import 'package:maison_moel/data/services/Api.dart';

class CommandeState extends StatefulWidget {
  const CommandeState({super.key, required this.title, required this.token});
  final String title;
  final String token;

  @override
  State<CommandeState> createState() => _CommandeState();
}

class _CommandeState extends State<CommandeState> {
  final controller = PageController(initialPage: 1);
  List<String> options = ['En préparation', 'Terminé', 'Annulé'];
  int selectedIndex = 0;
  Widget widgets = const Text("data");

  Widget CommandesWidget(int index, String token) {
    return FutureBuilder<List<Commande>>(
      future: API.getCommandes(index, token),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Aucune commande dans cet état.', style: TextStyle(color: Color(0xFFFFEB99))));
        } else {
          List<Commande> commandes = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: commandes.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              Commande commande = commandes[index];
              return ListTile(
                shape: const Border(
                  bottom: BorderSide(
                    color: Color(0xFFFFEB99),
                    width: 0.5,
                  ),
                ),
                title: Text('Commande n°${commande.idCommande}'),
                subtitle: Text("Date : ${commande.date.substring(0,10)} ${commande.date.substring(11,16)}"),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.info,
                    size: 30,
                  ),
                  onPressed: () {
                    bottomSheetInfoCommande(context, commande);
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

  void GenerateCommandes(int index) {
    setState(() {
      widgets = CommandesWidget(index+1, widget.token);
    });
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    GenerateCommandes(0);
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
                    GenerateCommandes(index);
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
        ],
      ),
    );
  }
}