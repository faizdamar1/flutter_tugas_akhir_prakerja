import 'package:flutter/material.dart';
import 'package:flutter_tugas_akhir_prakerja/model/chat_model.dart';

class CustomContactCard extends StatelessWidget {
  const CustomContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 23,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            contact.select
                ? const Positioned(
                    right: 5,
                    bottom: 4,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 11,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(
        contact.name!,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(contact.status == null ? '' : contact.status!),
    );
  }
}
