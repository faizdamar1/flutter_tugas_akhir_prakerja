import 'package:flutter/material.dart';
import 'package:flutter_tugas_akhir_prakerja/model/chat_model.dart';
import 'package:flutter_tugas_akhir_prakerja/screen/contact/contact_screen.dart';
import 'package:flutter_tugas_akhir_prakerja/screen/widget/custom_card_chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void removeItem(int index) {
    setState(() {
      chats = List.from(chats)..removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return InkWell(
            onLongPress: () {
              removeItem(index);
            },
            child: CustomCard(
              chat: chats[index],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chat),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => const ContactScreen(),
            ),
          );
        },
      ),
    );
  }
}
