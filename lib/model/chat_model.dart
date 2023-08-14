class ChatModel {
  String? name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  String? status;
  bool select = false;
  ChatModel({
    this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMessage,
    this.status,
    this.select = false,
  });
}

List<ChatModel> chats = [
  ChatModel(
    name: "Faiz",
    icon: "person.svg",
    isGroup: false,
    time: "4:00",
    currentMessage: "Hy Everyone!",
  ),
  ChatModel(
    name: "Damar",
    icon: "person.svg",
    isGroup: false,
    time: "5:00",
    currentMessage: "Hy Everyone!",
  ),
  ChatModel(
    name: "Hernanda",
    icon: "person.svg",
    isGroup: false,
    time: "6:00",
    currentMessage: "Hy Everyone!",
  ),
  ChatModel(
    name: "Para Wibu",
    icon: "groups.svg",
    isGroup: true,
    time: "7:04",
    currentMessage: "Hy Everyone!",
  ),
  ChatModel(
    name: "Uzumaki",
    icon: "person.svg",
    isGroup: false,
    time: "9:00",
    currentMessage: "Hy Everyone!",
  ),
];

List<ChatModel> contactList = [
  ChatModel(
    name: "Dev Stack",
  ),
  ChatModel(name: "Faiz", status: "Flutter Developer..........."),
  ChatModel(name: "Damar", status: "Web developer..."),
  ChatModel(name: "Hernanda", status: "App developer...."),
  ChatModel(name: "Uzumaki", status: "Raect developer.."),
  ChatModel(name: "Naruto", status: "Full Stack Web"),
  ChatModel(name: "Testing1", status: "Example work"),
  ChatModel(name: "Testing2", status: "Sharing is caring"),
  ChatModel(name: "Divyanshu", status: "....."),
  ChatModel(name: "Helper", status: "Love you Mom Dad"),
  ChatModel(name: "Tester", status: "I find the bugs"),
];
