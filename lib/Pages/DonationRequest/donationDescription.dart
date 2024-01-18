import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DonationDescription extends StatefulWidget {
  const DonationDescription({Key? key}) : super(key: key);

  @override
  State<DonationDescription> createState() => _State();
}

class _State extends State<DonationDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                height: 350,
                width: 400,
                decoration: BoxDecoration(color: Colors.lightGreen),
                child: Center(child: Text("Space for Image")),
              ),
            ),
            Container(
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 30,
                        ),
                      ),
                      Container(
                        child: CircleAvatar(
                          radius: 30,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                            // height: 100,
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "If you still face overflow issues, you might need to review the surrounding widget tree to ensure that the ListView.builder is placed withil face overflow issues, you might need to review the surrounding widget tree to ensure that the ListView.builder is placed within a container or a widget that col face overflow issues, you might need to review the surrounding widget tree to ensure that the ListView.builder is placed within a container or a widget that con a container or a widget that constrains its height. Additionally, you might want to check if the ListView.builder is intended to have more than one item (itemCount: 1). If you plan to have multiple items, set itemCount to the actual number of items in your list.",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 10,
                left: 40,
                child: Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text(
                      "Donate Now",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
            Positioned(
              top: 200,
              left: 48,
              child: Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.6)),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Feeding India",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            // overflow: TextOverflow.ellipsis
                          ),
                        ),
                        Text(
                          "Mumbai.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            // overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
