import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Chatting/VideoChatting.dart';

class AdminMessage extends StatefulWidget {
  const AdminMessage({super.key});

  @override
  State<AdminMessage> createState() => _AdminMessageState();
}

class _AdminMessageState extends State<AdminMessage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User _user;
  String _messageText = '';
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        setState(() {
          _user = user;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _sendMessage() async {
    try {
      await _firestore.collection('messages').add({
        'text': _messageText,
        'sender': _user.email,
        'receiver': 'dr.sanduk@gmail.com', // Replace with the recipient's email
        'timestamp': FieldValue.serverTimestamp(),
      });
      _messageController.clear();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 11.0),
            child: IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.videoCamera,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VideoChatting(
                      callID: '1',
                    ),
                  ),
                );
              }, //
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .where('receiver')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final messages = snapshot.data!.docs;
                List<MessageBubble> messageBubbles = [];
                for (var message in messages) {
                  final Map<String, dynamic> messageData =
                      message.data() as Map<String, dynamic>;
                  final messageText = messageData['text'] as String;
                  final messageSender = messageData['sender'] as String;

                  final currentUser = _user.email;

                  final messageBubble = MessageBubble(
                    sender: messageSender,
                    text: messageText,
                    isMe: currentUser == messageSender,
                  );

                  messageBubbles.add(messageBubble);
                }
                return ListView(
                  children: messageBubbles,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onChanged: (value) {
                      setState(() {
                        _messageText = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_messageText.isNotEmpty) {
                      _sendMessage();
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

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text, required this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
