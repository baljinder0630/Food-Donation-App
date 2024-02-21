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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/chatbot_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).padding.top + kToolbarHeight,
                child: AppBar(
                  title: const Text(
                    'Aahar',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
              Expanded(
                child: MessagesScreen(messages: messages),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          cursorColor: Colors.green,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Enter your query here',
                            prefixIcon: const Icon(Icons.chat_bubble_outline),
                            hintStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorStyle: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.clear();
                        },
                        icon: const Icon(
                          Icons.send,
                          size: 25.0,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.clear();
                        },
                        icon: const Icon(
                          Icons.mic_outlined,
                          size: 25.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
