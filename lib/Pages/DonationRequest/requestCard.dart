import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constants/constants.dart';

class DonationCard extends StatelessWidget {
  const DonationCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: blue1.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ], borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: blue1,
                        child: CircleAvatar(
                          radius: 25,
                          child: Image.asset(
                            "lib/assets/icons/ngo.png",
                            width: 35,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: const Expanded(
                        child: Text(
                          "Feeding India ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 82,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 120,
                                child: Row(
                                  children: [
                                    Icon(Icons.volunteer_activism, size: 20),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "Food Donation",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: 120,
                                child: Row(
                                  children: [
                                    Icon(Icons.groups, size: 20),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "600 People",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 120,
                                child: Row(
                                  children: [
                                    Icon(Icons.verified, size: 20),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "Karam Foundation",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: 120,
                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_today, size: 20),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "30/01/2023",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          getPercent(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth / 2 - 11,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                  ),
                  child: Material(
                    elevation: 4.0,
                    color: blue1, // Set the elevation as desired
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "Donate Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth / 2 - 11,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(18),
                  ),
                  child: Material(
                    elevation: 4.0,
                    color: Colors.lightGreen, // Set the elevation as desired
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "Donate Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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

Widget getPercent() {
  return Center(
    child: CircularPercentIndicator(
      radius: 35,
      percent: 0.4,
      progressColor: blue1,
      lineWidth: 8,
      backgroundColor: Colors.lightGreen,
      circularStrokeCap: CircularStrokeCap.round,
      center: const Text(
        "40%",
        style: TextStyle(fontSize: 18),
      ),
    ),
  );
}
