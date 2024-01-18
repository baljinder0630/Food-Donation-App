import 'package:flutter/material.dart';

import '../constants/constants.dart';

class PickUpRequest extends StatelessWidget {
  const PickUpRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: purple3, borderRadius: BorderRadius.circular(12)),
      height: 400,
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
                    "Idlii Sambhar & Vada, 3kg",
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
                    "Cooked 4 hrs Ago.",
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
                              "lib/assets/icons/food.png",
                              height: 60,
                            )),
                      ),
                    ),
                  );
                }),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                width: 330,
                child: const Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Text(
                        "Meerut.",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 17,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                  //  Location is displayed here.
                ),
              ),
              Container(
                width: 330,
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 11, right: 8),
                child: const Expanded(
                  child: Text(
                    "2 km away(approx).",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontSize: 17,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 135,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(backgroundColor: null),
                  child: const SizedBox(
                    width: 230,
                    child: Center(
                      child: Text(
                        "Accept",
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
              ),
              SizedBox(
                width: 135,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(backgroundColor: null),
                  child: const SizedBox(
                    width: 230,
                    child: Center(
                      child: Text(
                        "Reject",
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
