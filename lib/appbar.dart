import 'package:flutter/material.dart';

class Appbar_Principal extends StatefulWidget implements PreferredSizeWidget{
  final String title;
  final List<Widget> listWidget = [];

  Appbar_Principal({super.key, required this.title});

  @override
  State<Appbar_Principal> createState() => _Appbar_PrincipalState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Appbar_PrincipalState extends State<Appbar_Principal> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: const TextStyle(
          color: Colors.black,
        fontSize: 22,
      ),
      title: Text(
          widget.title,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
      actions: <Widget>[
        IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
