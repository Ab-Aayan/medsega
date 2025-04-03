import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return ListView.separated(
      itemBuilder: (context, index) {
        final message = widget.messages[index];
        final isUserMessage = message['isUserMessage'];
        final currentTime = DateTime.now();

        return Column(
          children: [
            Text(
              '${currentTime.hour}:${currentTime.minute}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: isUserMessage
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundImage: isUserMessage
                          ? const AssetImage('assets/images/Ellipse_1.png')
                          : const AssetImage('assets/images/cht_1.png'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(14),
                        topRight: const Radius.circular(12),
                        bottomRight: Radius.circular(isUserMessage ? 0 : 8),
                        topLeft: Radius.circular(isUserMessage ? 8 : 0),
                      ),
                      color: isUserMessage
                          ? Color.fromRGBO(113, 81, 230, 0.875)
                          : Colors.grey.shade900.withOpacity(0.8),
                    ),
                    constraints: BoxConstraints(maxWidth: w * 2 / 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['message'].text.text[0],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (_, i) =>
          const Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
    );
  }
}


/*
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return ListView.separated(
      itemBuilder: (context, index) {
        final message = widget.messages[index];
        final isUserMessage = message['isUserMessage'];
        final messageTime = message['time']; // Assuming you have a 'time' field in your message object

        final time = DateTime.fromMillisecondsSinceEpoch(messageTime);
        final formattedTime = '${time.hour}:${time.minute}';

        return Column(
          children: [
            Text(
              formattedTime,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: isUserMessage
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      backgroundImage: isUserMessage
                          ? const AssetImage('assets/images/Ellipse_1.png')
                          : const AssetImage('assets/images/cht_1.png'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(14),
                        topRight: const Radius.circular(12),
                        bottomRight: Radius.circular(isUserMessage ? 0 : 8),
                        topLeft: Radius.circular(isUserMessage ? 8 : 0),
                      ),
                      color: isUserMessage
                          ? Color.fromRGBO(113, 81, 230, 0.875)
                          : Colors.grey.shade900.withOpacity(0.8),
                    ),
                    constraints: BoxConstraints(maxWidth: w * 2 / 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['message'].text.text[0],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (_, i) => const Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
    );
  }
}


*/