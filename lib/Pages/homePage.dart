import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String username;

  void getData() async
  {
    print("In getData fun...");
  }

  void initState(){
    super.initState();
    getData();
    print("In Init State..");
  }

  void setState(fn){
    super.setState(() {
      print("Int Set State... ");
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          //  Column for greetings
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(radius: 40,),
                Column(
                  children: <Widget>[
                    Text("Hello, ##Anupam##!"),
                    Row(
                      children: <Widget>[
                        Text("##Location##"),
                        Icon(Icons.place),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 40),
            Column(
              children: <Widget>[
                Text("Nearby Hunger Spots.. in ## Location ##."),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("## Name of NGO ##"),
                        Text("## 400m ##"),
                        CircleAvatar(radius: 30,)
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: <Widget>[
                        Text("## Name of NGO2 ##"),
                        Text("## 900m ##"),
                        CircleAvatar(radius: 30,)
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: <Widget>[
                        Text("## Name of NGO3 ##"),
                        Text("## 1300m ##"),
                        CircleAvatar(radius: 30,)
                      ],
                    )
                  ],
                )

              ],
            ),
            SizedBox(height: 50),
            Column(
              children: <Widget>[
                Text("Food Pickup request in ## Location ##."),
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("## Name Reciepe1 ##"),
                        Text("## Cooked ##4m## ago ##"),
                        Row(children: [CircleAvatar(radius: 30,),SizedBox(width: 4,), CircleAvatar(radius: 30,),],),
                        Row(children: [Icon(Icons.place),Text("##Address##")],),
                        Text("##2 KM## away(approx)."),
                        Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              child: Text("Accept"),
                            ),
                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              child: Text("Reject"),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: <Widget>[
                        Text("## Name Reciepe2 ##"),
                        Text("## Cooked ##4m## ago ##"),
                        CircleAvatar(radius: 30,),
                        Row(children: [Icon(Icons.place),Text("##Address##")],),
                        Text("##2 KM## away(approx)."),
                        Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              child: Text("Accept"),
                            ),
                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              child: Text("Reject"),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: <Widget>[
                        Text("## Name Reciepe3 ##"),
                        Text("## Cooked ##4m## ago ##"),
                        CircleAvatar(radius: 30,),
                        Row(children: [Icon(Icons.place),Text("##Address##")],),
                        Text("##2 KM## away(approx)."),
                        Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              child: Text("Accept"),
                            ),
                            ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              child: Text("Reject"),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )

              ],
            ),
            Text("HH")
          ],
        ),
      ),
    );
  }
}
