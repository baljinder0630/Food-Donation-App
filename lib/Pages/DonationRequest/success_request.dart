import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:food_donation_app/Router/route.gr.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPage();
}

class _SuccessPage extends State<SuccessPage> {
  // late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    // _audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/assets/images/success.jpg",
              height: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              'Posted Successfully',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'THANK YOU',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '"HOPE IS LIKE A FLAME; IT CAN NEVER BE EXTINGUISHED, EVEN IN THE DARKEST OF TIMES."',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'WE HOPE YOU GET A BETTER SUPPORT',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Further Notifications Will Be Updated',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.pushRoute(const DonationRequestRoute());
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }

  // void _playSuccessSound() async {
  //   try {
  //     // await _audioPlayer.play('assets/sounds/success.mp3');
  //   } catch (e) {
  //     print('Error playing audio: $e');
  //   }
  // }

  @override
  void dispose() {
    // _audioPlayer.dispose();
    super.dispose();
  }
}
