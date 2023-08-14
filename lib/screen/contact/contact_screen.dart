import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tugas_akhir_prakerja/model/chat_model.dart';
import 'package:flutter_tugas_akhir_prakerja/screen/widget/custom_bottom_card.dart';
import 'package:flutter_tugas_akhir_prakerja/screen/widget/custom_card_contact.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Select contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "256 contacts",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.search,
                size: 26,
              ),
              onPressed: () {}),
          PopupMenuButton<String>(
            padding: const EdgeInsets.all(0),
            onSelected: (value) {
              if (kDebugMode) {
                print(value);
              }
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                const PopupMenuItem(
                  value: "Invite a friend",
                  child: Text("Invite a friend"),
                ),
                const PopupMenuItem(
                  value: "Contacts",
                  child: Text("Contacts"),
                ),
                const PopupMenuItem(
                  value: "Refresh",
                  child: Text("Refresh"),
                ),
                const PopupMenuItem(
                  value: "Help",
                  child: Text("Help"),
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () {},
              child: const CustomBottonCard(
                name: "New group",
                icon: Icons.group_add,
              ),
            );
          } else if (index == 1) {
            return const CustomBottonCard(
                name: "New contact", icon: Icons.person_add);
          }
          return CustomContactCard(
            contact: contactList[index - 2],
          );
        },
      ),
    );
  }
}
