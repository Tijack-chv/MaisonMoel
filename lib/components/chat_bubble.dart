import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maison_moel/data/Message.dart';

class ChatBubble extends StatelessWidget {
  final Message message;
  final bool isMe;
  final String nom;

  const ChatBubble({super.key, required this.message, required this.isMe, required this.nom});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isMe ? Color(0xFF323232) : Color(0xFFFFEB99),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  nom,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: isMe ? Color(0xFF616161) : Color(0xFF494949),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  DateFormat('HH:mm').format(DateTime.parse(message.date)),
                  style: TextStyle(
                    fontSize: 12.0,
                    color: isMe ? Color(0xFF616161) : Color(0xFF494949),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              message.message,
              style: TextStyle(
                color: isMe ? Color(0xFFFFEB99) : Color(0xFF323232),
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}