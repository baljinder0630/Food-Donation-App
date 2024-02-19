import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({super.key, required this.messages});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: (widget.messages[index]['isUserMessage'] == true
                ? MainAxisAlignment.end
                : MainAxisAlignment.start),
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: const EdgeInsets.all(10.0),
                  padding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(
                          20,
                        ),
                        topRight: const Radius.circular(20),
                        bottomRight: Radius.circular(
                            widget.messages[index]['isUserMessage'] ? 0 : 20),
                        topLeft: Radius.circular(
                            widget.messages[index]['isUserMessage'] ? 20 : 0),
                      ),
                      color: widget.messages[index]['isUserMessage']
                          ? Colors.deepPurple
                          : Colors.green.withOpacity(0.5)),
                  constraints: BoxConstraints(maxWidth: w * 2 / 3),
                  child: Text(
                    widget.messages[index]['message'],
                    style: TextStyle(
                        color: widget.messages[index]['isUserMessage']
                            ? Colors.white.withOpacity(0.5)
                            : Colors.deepPurple),
                  )),
            ],
          );
        },
        separatorBuilder: (_, i) => const Padding(
          padding: EdgeInsets.only(top: 10.0),
        ),
        itemCount: widget.messages.length);
  }
}
