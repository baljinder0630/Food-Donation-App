import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/HomePages/hungerSpots.dart';
import 'package:food_donation_app/Pages/HomePages/pickupRequest.dart';

class HomePage extends StatelessWidget {
  final List postId = [
    '11',
    '12',
    '13',
    '14',
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(children: [
                              Text(
                                "Hello, Anupam! ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ]),
                            Row(
                              children: [
                                Icon(Icons.place),
                                Text(
                                  "Meerut.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(10),
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nearby hunger spots you can serve in ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Row(
                          children: [
                            Icon(Icons.place),
                            Expanded(
                              child: Text(
                                "Gulbai Tekra, Navrangpura.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 320,
                    child: ListView.builder(
                        itemCount: postId.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return HungerSpot(child: postId[index]);
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(10),
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Food Pickup requests you can serve from",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Row(
                          children: [
                            Icon(Icons.place),
                            Expanded(
                              child: Text(
                                "Gulbai Tekra, Navrangpura.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 350,
                    child: ListView.builder(
                        itemCount: postId.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return PickUpReequest();
                        }),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
