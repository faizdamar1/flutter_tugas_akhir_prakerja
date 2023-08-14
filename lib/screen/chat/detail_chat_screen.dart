import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tugas_akhir_prakerja/model/chat_model.dart';

class DetailChatScreen extends StatefulWidget {
  const DetailChatScreen({super.key, required this.chat});

  final ChatModel chat;

  @override
  State<DetailChatScreen> createState() => _DetailChatScreenState();
}

class _DetailChatScreenState extends State<DetailChatScreen> {
  bool showEmoji = false;
  late Size size = MediaQuery.of(context).size;
  FocusNode focusNode = FocusNode();
  TextEditingController msgController = TextEditingController();

  void unfocusNode() {
    focusNode.unfocus();
    focusNode.canRequestFocus = false;
  }

  @override
  void dispose() {
    msgController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmoji = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leadingWidth: 88,
        titleSpacing: 3,
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chat.name!,
                  style: const TextStyle(
                      fontSize: 18.5, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "last seen today at 10.04",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
        leading: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blueGrey,
              child: widget.chat.isGroup!
                  ? const Icon(
                      Icons.group,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (kDebugMode) {
                print(value);
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: "View Contact",
                  child: Text("View Contact"),
                ),
                const PopupMenuItem(
                  value: "Media, links, and docs",
                  child: Text("Media, links, and docs"),
                ),
                const PopupMenuItem(
                  value: "Whatsapp Web",
                  child: Text("Whatsapp Web"),
                ),
                const PopupMenuItem(
                  value: "Search",
                  child: Text("Search"),
                ),
                const PopupMenuItem(
                  value: "Mute Notification",
                  child: Text("Mute Notification"),
                ),
                const PopupMenuItem(
                  value: "Wallpaper",
                  child: Text("Wallpaper"),
                ),
              ];
            },
          )
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: WillPopScope(
          onWillPop: () {
            if (showEmoji) {
              setState(() {
                showEmoji = !showEmoji;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width - 60,
                          child: Card(
                            margin: const EdgeInsets.only(
                                left: 2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: msgController,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message",
                                hintStyle: const TextStyle(color: Colors.grey),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.attach_file),
                                      onPressed: () {
                                        unfocusNode();
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder) =>
                                                bottomSheet());
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.camera_alt),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      if (!showEmoji) {
                                        unfocusNode();
                                      }
                                      setState(() {
                                        showEmoji = !showEmoji;
                                      });
                                    },
                                    icon: Icon(showEmoji
                                        ? Icons.emoji_emotions
                                        : Icons.keyboard)),
                                contentPadding: const EdgeInsets.all(5),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                            right: 2,
                            left: 3,
                          ),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFF128C7E),
                            radius: 25,
                            child: IconButton(
                              icon: const Icon(Icons.mic),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    Offstage(
                      offstage: !showEmoji,
                      child: const SizedBox(
                        height: 250,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(
                    Icons.insert_drive_file, Colors.indigo, "Document"),
                const SizedBox(width: 40),
                iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                const SizedBox(width: 40),
                iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(Icons.headset, Colors.orange, "Audio"),
                const SizedBox(width: 40),
                iconCreation(Icons.location_pin, Colors.teal, "Location"),
                const SizedBox(width: 40),
                iconCreation(Icons.person, Colors.blue, "Contact"),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }
}
