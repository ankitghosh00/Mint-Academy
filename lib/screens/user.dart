import 'package:flutter/material.dart';
import 'package:mintacademy/components/bottom_bar.dart';
import 'package:mintacademy/screens/course.dart';

// class UserInfo extends StatefulWidget {
//   @override
//   _UserInfoState createState() => _UserInfoState();
// }

// class _UserInfoState extends State<UserInfo> {
//   ScrollController _scrollController;
//   var top = 0.0;
//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _scrollController.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           CustomScrollView(
//             controller: _scrollController,
//             slivers: <Widget>[
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 elevation: 4,
//                 expandedHeight: 200,
//                 pinned: true,
//                 flexibleSpace: LayoutBuilder(builder:
//                     (BuildContext context, BoxConstraints constraints) {
//                   top = constraints.biggest.height;
//                   return Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                           // colors: [
//                           //   ColorsConsts.starterColor,
//                           //   ColorsConsts.endColor,
//                           // ],
//                           begin: const FractionalOffset(0.0, 0.0),
//                           end: const FractionalOffset(1.0, 0.0),
//                           stops: [0.0, 1.0],
//                           tileMode: TileMode.clamp),
//                     ),
//                     child: FlexibleSpaceBar(
//                       collapseMode: CollapseMode.parallax,
//                       centerTitle: true,
//                       title: Row(
//                         //  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           AnimatedOpacity(
//                             duration: Duration(milliseconds: 300),
//                             opacity: top <= 110.0 ? 1.0 : 0,
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 12,
//                                 ),
//                                 Container(
//                                   height: kToolbarHeight / 1.8,
//                                   width: kToolbarHeight / 1.8,
//                                   decoration: BoxDecoration(
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.white,
//                                         blurRadius: 1.0,
//                                       ),
//                                     ],
//                                     shape: BoxShape.circle,
//                                     image: DecorationImage(
//                                       fit: BoxFit.fill,
//                                       image: NetworkImage(
//                                           'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 12,
//                                 ),
//                                 Text(
//                                   // 'top.toString()',
//                                   'Guest',
//                                   style: TextStyle(
//                                       fontSize: 20.0, color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       background: Image(
//                         image: NetworkImage(
//                             'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//               SliverToBoxAdapter(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: userTitle('User Bag')),
//                     Divider(
//                       thickness: 1,
//                       color: Colors.grey,
//                     ),
//                     Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         splashColor: Theme.of(context).splashColor,
//                         child: ListTile(
//                           onTap: () => Navigator.of(context)
//                               .pushNamed(WebViewExample.routeName),
//                           title: Text('Course'),
//                           trailing: Icon(Icons.chevron_right_rounded),
//                           leading: Icon(Icons.golf_course_rounded),
//                         ),
//                       ),
//                     ),
//                     Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         splashColor: Theme.of(context).splashColor,
//                         child: ListTile(
//                           onTap: () {},
//                           title: Text('Cart'),
//                           trailing: Icon(Icons.chevron_right_rounded),
//                           leading: Icon(Icons.event),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: userTitle('User Information')),
//                     Divider(
//                       thickness: 1,
//                       color: Colors.grey,
//                     ),
//                     userListTile('Email', 'Email sub', 0, context),
//                     userListTile('Phone number', '4555', 1, context),
//                     userListTile('Shipping address', '', 2, context),
//                     userListTile('joined date', 'date', 3, context),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: userTitle('User settings'),
//                     ),
//                     Divider(
//                       thickness: 1,
//                       color: Colors.grey,
//                     ),
//                     userListTile('Logout', '', 4, context),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           _buildFab()
//         ],
//       ),
//     );
//   }

//   Widget _buildFab() {
//     //starting fab position
//     final double defaultTopMargin = 200.0 - 4.0;
//     //pixels from top where scaling should start
//     final double scaleStart = 160.0;
//     //pixels from top where scaling should end
//     final double scaleEnd = scaleStart / 2;

//     double top = defaultTopMargin;
//     double scale = 1.0;
//     if (_scrollController.hasClients) {
//       double offset = _scrollController.offset;
//       top -= offset;
//       if (offset < defaultTopMargin - scaleStart) {
//         //offset small => don't scale down
//         scale = 1.0;
//       } else if (offset < defaultTopMargin - scaleEnd) {
//         //offset between scaleStart and scaleEnd => scale down
//         scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
//       } else {
//         //offset passed scaleEnd => hide fab
//         scale = 0.0;
//       }
//     }

//     return Positioned(
//       top: top,
//       right: 16.0,
//       child: Transform(
//         transform: Matrix4.identity()..scale(scale),
//         alignment: Alignment.center,
//         child: FloatingActionButton(
//           backgroundColor: Colors.purple,
//           heroTag: "btn1",
//           onPressed: () {},
//           child: Icon(Icons.camera_alt_outlined),
//         ),
//       ),
//     );
//   }

//   List<IconData> _userTileIcons = [
//     Icons.email,
//     Icons.phone,
//     Icons.local_shipping,
//     Icons.watch_later,
//     Icons.exit_to_app_rounded
//   ];

//   Widget userListTile(
//       String title, String subTitle, int index, BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         splashColor: Theme.of(context).splashColor,
//         child: ListTile(
//           onTap: () {},
//           title: Text(title),
//           subtitle: Text(subTitle),
//           leading: Icon(_userTileIcons[index]),
//         ),
//       ),
//     );
//   }

//   Widget userTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.all(14.0),
//       child: Text(
//         title,
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mintacademy/screens/course.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  ScrollController _scrollController;
  var top = 0.0;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: (() {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BottomBarScreen();
        }));
      }),
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverAppBar(
                  // leading: Icon(Icons.ac_unit_outlined),
                  // automaticallyImplyLeading: false,
                  elevation: 0,
                  expandedHeight: 200,
                  pinned: true,
                  flexibleSpace: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    top = constraints.biggest.height;

                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.lightGreen,
                              Colors.green,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: FlexibleSpaceBar(
                        // collapseMode: CollapseMode.parallax,
                        centerTitle: true,
                        title: AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: top <= 110.0 ? 1.0 : 0,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                height: kToolbarHeight / 1.8,
                                width: kToolbarHeight / 1.8,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Guest',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        background: Image(
                          image: NetworkImage(
                              'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: userTitle('User Bag')),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Theme.of(context).splashColor,
                          child: ListTile(
                            onTap: () => Navigator.of(context)
                                .pushNamed(WebViewExample.routeName),
                            title: Text('Course'),
                            trailing: Icon(Icons.chevron_right_rounded),
                            leading: Icon(Icons.auto_stories_rounded),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Theme.of(context).splashColor,
                          child: ListTile(
                            onTap: () {},
                            title: Text('Cart'),
                            trailing: Icon(Icons.chevron_right_rounded),
                            leading: Icon(Icons.business_center_sharp),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Theme.of(context).splashColor,
                          child: ListTile(
                            onTap: () {},
                            title: Text('Aboutus'),
                            trailing: Icon(Icons.chevron_right_rounded),
                            leading: Icon(Icons.attribution),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Theme.of(context).splashColor,
                          child: ListTile(
                            onTap: () {},
                            title: Text('Contactus'),
                            trailing: Icon(Icons.chevron_right_rounded),
                            leading: Icon(Icons.add_ic_call_sharp),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: userTitle('User Information')),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      userListTile('Email', 'Email sub', 0, context),
                      userListTile('Phone number', '4555', 1, context),
                      userListTile('Shipping address', '', 2, context),
                      userListTile('joined date', 'date', 3, context),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle('User settings'),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      userListTile('Logout', '', 4, context),
                    ],
                  ),
                )
              ],
            ),
            _buildFab()
          ],
        ),
      ),
    );
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.assessment_rounded),
        ),
      ),
    );
  }

  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  Widget userListTile(
      String title, String subTitle, int index, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(subTitle),
          leading: Icon(_userTileIcons[index]),
        ),
      ),
    );
  }

  Widget userTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
    );
  }
}
