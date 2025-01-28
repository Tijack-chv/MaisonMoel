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
    );
  }
}
