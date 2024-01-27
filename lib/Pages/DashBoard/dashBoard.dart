import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Router/route.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

// class _DashBoardPageState extends State<DashBoardPage> {
//   int _currentPage = 1;
//   String? vThumbImage;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             const CircleAvatar(
//               radius: 50.0,
//               // backgroundImage: AssetImage('assets/profile_pic.jpg'),
//               child: Icon(
//                 Icons.person,
//                 size: 50.0,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle photo upload and edit
//                 context.navigateTo(CameraScreenRoute());
//               },
//               child: Text('Upload / Edit Photo'),
//             ),
//             SizedBox(height: 20.0),
//             const Text(
//               'Hi Chhawinder',
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 30.0),
//             Column(
//               children: [
//                 DashboardButton(
//                   text: 'Settings',
//                   onPressed: () {
//                     // Handle Settings button press
//                   },
//                 ),
//                 SizedBox(height: 10.0),
//                 DashboardButton(
//                   text: 'Your Donations',
//                   onPressed: () {
//                     // Handle Your Donations button press
//                   },
//                 ),
//                 SizedBox(height: 10.0),
//                 DashboardButton(
//                   text: 'Logout',
//                   onPressed: () {
//                     context.pushRoute(const SignUpPageRoute());
//                   },
//                 ),
//                 SizedBox(height: 10.0),
//                 DashboardButton(
//                   text: 'Contact Us',
//                   onPressed: () {
//                     // Handle Contact Us button press
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DashboardButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DashboardButton({
    required this.text,
    required this.onPressed,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

// class InstagramProfile extends StatefulWidget {
//   @override
//   _InstagramProfileState createState() => _InstagramProfileState();
// }

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.blueGrey,
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "john.doe",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                ),
                onPressed: () => print("Add"),
              ),
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () => {
                  showModalBottomSheet(context: context,  builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                              leading: Icon(Icons.settings),
                              title: Text('Settings and privacy'),
                              onTap: (){},
                              ),
                              
                          ListTile(
                              leading: Icon(Icons.message),
                              title: Text('Threads'),
                              trailing: Chip(
                                label: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    '9+',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                              )),
                          // Add more ListTiles here for other options
                        ],
                      );
                    },
                  )
                },
              ),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left:12.r,top:12.r,bottom:24.r),
            child:Container(
              color: Colors.white,
              child: ProfileWidget(),
            ),
            ),
            
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[400],
              indicatorWeight: 1,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.grid_on_sharp,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.save,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Gallery(),
                  // Igtv(),
                  // Reels(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage:
              AssetImage('assets/profile.jpg'), // Add path to your image file
        ),
        SizedBox(width: 20.r),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left:16.r),
            child:Text('Chhawinder',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
            ),
            
            
            SizedBox(height: 10.r),
            Row(children: [
              _buildStatColumn('4', 'posts'),
              _buildStatColumn('891', 'followers'),
              _buildStatColumn('1,160', 'following'),
            ])
          ],
        )
      ],
    );
  }

  Column _buildStatColumn(String number, String title) {
    return Column(
      children: [
        Text(
            number,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
        Padding(
          padding: EdgeInsets.all( 8.0.r), // Adjust the padding as needed
          child: Text(
            title,
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        
      ],
    );
  }

}
