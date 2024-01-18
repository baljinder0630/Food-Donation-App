import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Router/route.gr.dart';

@RoutePage()
class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
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
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/profile_pic.jpg'),
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
                    // Handle Logout button press
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

void _handleNavigation(int index, BuildContext context) {
  switch (index) {
    case 0:
      // Navigate to Home screen
       context.router.replace(const HomePageRoute());
      break;
    case 1:
      // Navigate to Dashboard screen
      context.router.replace(const DashBoardRoute());
      break;
    case 2:
      // Navigate to Profile screen
      // context.router.replace(const ProfilePageRoute());
      break;
    case 3:
      // Navigate to Notifications screen
      // context.router.replace(const NotificationsPageRoute());
      break;
  }
}
