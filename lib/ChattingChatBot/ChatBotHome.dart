import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsega/ChattingChatBot/Messages.dart';
import 'package:medsega/Group/helper/helper_function.dart';

class ChatBotHome extends StatefulWidget {
  ChatBotHome({super.key});

  @override
  State<ChatBotHome> createState() => _ChatBotHomeState();
}

class _ChatBotHomeState extends State<ChatBotHome> {
  late DialogFlowtter dialogFlowtter;
  final DataController controller = DataController();
  final TextEditingController _controller = TextEditingController();
  var hour = DateTime.now().hour;

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  }

  @override
  Widget build(BuildContext context) {
    controller.onReady();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(400),
        child: SizedBox(
          height: 160,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.help),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getGreetingMessage(),
                      style: GoogleFonts.heebo(
                        fontSize: 22,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${controller.userProfileData['userName']}',
                      style: GoogleFonts.heebo(
                        fontSize: 16,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: MessagesScreen(messages: messages),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 14.0,
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: "Enter your password",
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: const Icon(Icons.send),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }

  String getGreetingMessage() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;

    String greetingMessage;

    if (currentHour >= 5 && currentHour < 12) {
      greetingMessage = 'Good morning,';
    } else if (currentHour >= 12 && currentHour < 17) {
      greetingMessage = 'Good afternoon,';
    } else {
      greetingMessage = 'Good evening,';
    }

    return greetingMessage;
  }
}
