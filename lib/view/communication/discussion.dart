import 'dart:async';
import 'package:flutter/material.dart';
import 'package:maison_moel/components/appbar.dart';
import 'package:maison_moel/components/chat_bubble.dart';
import 'package:maison_moel/data/Message.dart';
import 'package:maison_moel/data/services/Api.dart';

class Discussion extends StatefulWidget {
  const Discussion({super.key, required this.title, required this.token});
  final String title;
  final String token;

  @override
  State<Discussion> createState() => _Discussion();
}

class _Discussion extends State<Discussion> {
  List<String> messages = [];
  final TextEditingController _controller = TextEditingController();
  Widget chat = const Text("data");
  Timer? _timer;

  Widget refreshChat() {
    return FutureBuilder<List<Message>>(
      future: API.getMessages(widget.token),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur: ${snapshot.error}'));
        } else {
          List<Message> messages = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ChatBubble(message: messages[index].message, nom: messages[index].nom, isMe: messages[index].token == widget.token);
            },
          );
        }
      },
    );

  }

  Future<void> sendMessage(String texte, String token) async {
    await API.sendMessage(texte, token);
    setState(() {
      chat = refreshChat();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 15), (Timer t) {
      setState(() {
        chat = refreshChat();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    chat = refreshChat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFFFEB99)),
        titleTextStyle: const TextStyle(
          color: Color(0xFFFFEB99),
          fontSize: 22,
        ),
        title: Text(
          widget.title,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Color(0xFFFFEB99),
            ),
            onPressed: () {
              setState(() {
                chat = refreshChat();
              });
            },
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(3.0),
            child: Container(
              color: Color(0xFFFFEB99),
              height: 2.0,
            )
        ),
        backgroundColor: Color(0xFF292929),
      ),
      body: Column(
        children: [
          Expanded(
            child: chat,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(
                      color: Color(0xFFFFEB99),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Entrez votre message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Color(0xFFFFEB99),
                  ),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      setState(() {
                        sendMessage(_controller.text, widget.token);
                      });
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}