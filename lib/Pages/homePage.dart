import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Pages/HomePages/hungerSpots.dart';
import 'package:food_donation_app/Pages/HomePages/pickupRequest.dart';

@RoutePage()
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
            physics: BouncingScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.lightGreen),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: const Row(
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
                  // Here Avatar and Name container ends.

                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Colors.lightGreen),
                    child:
                        const Center(child: Text("Space for some animation.")),
                  ),
                  // Animation ends here.

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Explore",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  //Explore Ends here.

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: mainOptions(context),
                  ),
                  // Here 4 widgets are done.

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nearby hunger spots you can serve in ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40,
                              child: const Icon(Icons.place),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        8.0), // Adjust padding as needed
                                child: const Text(
                                  "Gulbai Tekra, Navrangpura.Navrangpura",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines:
                                      1, // Set the maximum number of lines
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                child: const Text(
                                  "View All",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Here hungerSpot text with view All button ends..

                  Container(
                    height: 320,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: postId.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return HungerSpot(child: postId[index]);
                        }),
                  ),

                  // Here HungerSpots cards ends.

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Food Pickup requests you can serve from",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 30,
                              child: const Icon(Icons.place),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        3.0), // Adjust padding as needed
                                child: const Text(
                                  "Gulbai Tekra, Navrangpura.Navrangpura",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines:
                                      1, // Set the maximum number of lines
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                child: const Text(
                                  "View All",
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
                    ),
                  ),
                  // Here FoodPickup request text and viewAll button ends.

                  Container(
                    height: 350,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: postId.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const PickUpReequest();
                        }),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

Widget mainOptions(BuildContext context) {
  final List<Map<String, String>> gridMap = [
    {
      'title': "Donate",
      'description': "1,11+ Requests",
      'image': "lib/assets/images/exploreImages/donate.png",
      'action': '/donate',
    },
    {
      'title': "Articles",
      'description': "know the consequences and tips",
      'image': "lib/assets/images/exploreImages/articles.png",
      'action': '/articles',
    },
    {
      'title': "Community",
      'description': "connect with people and seek help",
      'image': "lib/assets/images/exploreImages/community.png",
      'action': '/community',
    },
    {
      'title': "Volunteer",
      'description': "support with donation",
      'image': "lib/assets/images/exploreImages/volunteer.png",
      'action': '/volunteer',
    }
  ];
  return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(16.0)),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6.0, left: 6.0),
                child: Text(
                  "${gridMap.elementAt(index)['title']}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("${gridMap.elementAt(index)['description']}"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: Image.asset("${gridMap.elementAt(index)['image']}",
                    height: 90, width: double.infinity, fit: BoxFit.cover),
              ),
            ],
          ),
        );
      });
}
