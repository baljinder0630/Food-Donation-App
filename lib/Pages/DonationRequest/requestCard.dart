import 'package:flutter/material.dart';

class DonationCard extends StatelessWidget {
  const DonationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.lightGreen),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 10),
                      child: CircleAvatar(radius: 25)),
                  Container(
                      child: Expanded(
                    child: Text(
                      "Feeding India ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )),
                  Text("6d Ago"),
                  SizedBox(
                    width: 80,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 140,
                        padding: EdgeInsets.only(right: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.food_bank_rounded, size: 20),
                                    Expanded(
                                      child: Text(
                                        "Food Donation",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.food_bank_rounded, size: 20),
                                    Expanded(
                                      child: Text(
                                        "Karam Foundation",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: 130,
                        padding: EdgeInsets.only(right: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.food_bank_rounded, size: 20),
                                    Expanded(
                                      child: Text(
                                        "600 People",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.food_bank_rounded, size: 20),
                                    Expanded(
                                      child: Text(
                                        "31-01-2023",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth / 2 - 10,
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text(
                      "Know More",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth / 2 - 10,
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
              ],
            ),
          ],
        ));
  }
}
