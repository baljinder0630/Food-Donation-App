import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_donation_app/Provider/userProvider.dart';
import 'package:food_donation_app/Router/route.gr.dart';

@RoutePage()
class DashBoardPage extends ConsumerStatefulWidget {
  const DashBoardPage({super.key});

  @override
  ConsumerState<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends ConsumerState<DashBoardPage> {
  int _currentPage = 1;
  String? vThumbImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50.0,
              // backgroundImage: AssetImage('assets/profile_pic.jpg'),
              child: Icon(
                Icons.person,
                size: 50.0,
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle photo upload and edit
              },
              child: Text('Upload / Edit Photo'),
            ),
            SizedBox(height: 20.0),
            const Text(
              'Hi Chhawinder',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Column(
              children: [
                DashboardButton(
                  text: 'Settings',
                  onPressed: () {
                    // Handle Settings button press
                  },
                ),
                SizedBox(height: 10.0),
                DashboardButton(
                  text: 'Your Donations',
                  onPressed: () {
                    // Handle Your Donations button press
                  },
                ),
                SizedBox(height: 10.0),
                DashboardButton(
                  text: 'Logout',
                  onPressed: () {
                    showGeneralDialog(
                        context: context,
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return AlertDialog(
                            title: Text('Logout'),
                            content: Text('Are you sure you want to logout?'),
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Handle Logout button press
                                  ref
                                      .watch(authStateProvider.notifier)
                                      .logout();
                                  Navigator.of(context).pop();
                                  context.router.pushAndPopUntil(
                                    const LoginPageRoute(),
                                    predicate: (route) => false,
                                  );
                                },
                                child: Text('Yes'),
                              ),
                            ],
                          );
                        });
                  },
                ),
                SizedBox(height: 10.0),
                DashboardButton(
                  text: 'Contact Us',
                  onPressed: () {
                    // Handle Contact Us button press
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DashboardButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
