import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

@RoutePage()
class HungerSpot extends StatelessWidget {
  final String child;

  const HungerSpot({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: purple3, borderRadius: BorderRadius.circular(12)),
      height: 320,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    "Hollywood Gali, Navrangpura Navrangpura",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    "400m away",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      widthFactor: 0.7,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            radius: 60,
                            backgroundColor: purple1,
                            child: Image.asset(
                              "lib/assets/icons/ngo.png",
                              height: 60,
                            )),
                      ),
                    ),
                  );
                }),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(backgroundColor: null),
            child: const SizedBox(
              width: 230,
              child: Center(
                child: Text(
                  "View More",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.italic,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
