import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_donation_app/Pages/DisasterNewsFeed/controller.dart';
import 'package:video_player/video_player.dart';
import 'package:shimmer/shimmer.dart';

class Player extends StatelessWidget {
  final int i;
  Player({Key? key, required this.i}) : super(key: key);

  final PCC c = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PCC>(
      initState: (x) async {
        if (c.api > 1) {
          await c.disposeController(c.api - 2);
        }
        if (c.api < c.videoPlayerControllers.length - 2) {
          await c.disposeController(c.api + 2);
        }
        if (!c.initilizedIndexes.contains(i)) {
          await c.initializePlayer(i);
        }
        if (c.api > 0) {
          if (c.videoPlayerControllers[c.api - 1] == null) {
            await c.initializeIndexedController(c.api - 1);
          }
        }
        if (c.api < c.videoPlayerControllers.length - 1) {
          if (c.videoPlayerControllers[c.api + 1] == null) {
            await c.initializeIndexedController(c.api + 1);
          }
        }
      },
      builder: (_) {
        if (c.videoPlayerControllers.isEmpty ||
            c.videoPlayerControllers[c.api] == null ||
            !c.videoPlayerControllers[c.api]!.value.isInitialized) {
          return Shimmer(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFEBEBF4),
                Color(0xFFF4F4F4),
                Color(0xFFEBEBF4),
              ],
              stops: [
                0.1,
                0.3,
                0.4,
              ],
              begin: Alignment(-1.0, -0.3),
              end: Alignment(1.0, 0.3),
              tileMode: TileMode.clamp,
            ),
            child: Container(color: Colors.grey.shade100),
          );
        }

        if (i == c.api) {
          //If Index equals Auto Play Index
          //Set AutoPlay True Here
          if (i < c.videoPlayerControllers.length) {
            if (c.videoPlayerControllers[c.api]!.value.isInitialized) {
              c.videoPlayerControllers[c.api]!.play();
            }
          }
          print('AutoPlaying ${c.api}');
        }
        return Stack(
          children: [
            c.videoPlayerControllers.isNotEmpty &&
                    c.videoPlayerControllers[c.api]!.value.isInitialized
                ? GestureDetector(
                    onTap: () {
                      if (c.videoPlayerControllers[c.api]!.value.isPlaying) {
                        print("paused");
                        c.videoPlayerControllers[c.api]!.pause();
                      } else {
                        c.videoPlayerControllers[c.api]!.play();
                        print("playing");
                      }
                    },
                    child: VideoPlayer(c.videoPlayerControllers[c.api]!),
                  )
                : const Center(child: CircularProgressIndicator()),
          ],
        );
      },
    );
  }
}
