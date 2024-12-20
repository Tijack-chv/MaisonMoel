import 'package:flutter/material.dart';
/*
class BottomBar_Principal extends StatefulWidget {
  const BottomBar_Principal({super.key});

  @override
  State<BottomBar_Principal> createState() => _BottomBar_PrincipalState();
}

class _BottomBar_PrincipalState extends State<BottomBar_Principal> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      bottomNavigationBar: NavigationBar (
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        indicatorColor: Colors.lightGreen,
        selectedIndex: _currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const <Widget>[
          NavigationDestination(
              selectedIcon: Icon(IconClass.home),
              icon: Icon(IconClass.home_outline),
              label: "Accueil"
          ),
          NavigationDestination(
              selectedIcon: Icon(IconClass.music),
              icon: Icon(IconClass.music_outline),
              label: "Liste des albums"
          ),
          NavigationDestination(
              selectedIcon: Icon(IconClass.cog),
              icon: Icon(IconClass.cog_outline),
              label: "Paramètres"
          ),
        ],
      ),
      appBar: Appbar_Principal(
        title: "Gestion des albums",
      ),
      body: <Widget>[
        MyHomePage(title: "GestionAlbums"),
        ListeAlbums(),
        Parametre(),
      ][_currentPageIndex],
    );
  }
}
*/
