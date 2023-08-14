import 'package:flutter/material.dart';
import 'package:flutter_tugas_akhir_prakerja/model/chat_model.dart';
import 'package:flutter_tugas_akhir_prakerja/screen/chat/detail_chat_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chat}) : super(key: key);
  final ChatModel chat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailChatScreen(
            chat: chat,
          );
        }));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: chat.isGroup!
                  ? const Icon(
                      Icons.group,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chat.name!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(chat.time!)
              ],
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.done_all,
                  color: Colors.black38,
                ),
                const SizedBox(width: 4),
                Text(
                  chat.currentMessage!,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 80.0, right: 20.0),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
