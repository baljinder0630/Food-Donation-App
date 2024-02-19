import 'package:auto_route/auto_route.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/ChatBot/messagesscreen.dart';

@RoutePage()
class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  late DialogFlowtter dialogflowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogflowtter = instance);
    super.initState();
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add(
        {'message': message.text?.text?[0], 'isUserMessage': isUserMessage});
  }

  sendMessage(String message) async {
    print(message);
    if (message.isEmpty) {
      return;
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [message])), true);
      });
      DetectIntentResponse response = await dialogflowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: message)));
      print("Response: $response");
      if (response.message == null)
        return;
      else {
        setState(() {
          addMessage(response.message!);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aahar'),
      ),
      body: Column(
        children: [
          Expanded(
            child: MessagesScreen(messages: messages),
          ),
          Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              color: Colors.deepPurple,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                            controller: _controller,
                            cursorColor: Colors.white,
                            style: const TextStyle(color: Colors.white))),
                    IconButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.clear();
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
