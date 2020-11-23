import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:levelupapp/constants.dart';
import 'package:levelupapp/Components/themes.dart';
import 'package:levelupapp/Components/demo_values.dart';
import 'package:levelupapp/Widgets/post_card.dart';
import 'package:levelupapp/Components/loading.dart';
import 'package:levelupapp/Screens/Chat/chat_main.dart';
import 'package:levelupapp/Screens/Chat/chat_settings.dart';

import 'package:levelupapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final String currentUserId;

  HomeScreen({Key key, @required this.currentUserId}) : super(key: key);

  @override
  State createState() => HomeScreenState(currentUserId: currentUserId);
}

final List<String> categories = ['Feed', 'Activities', 'Forum'];

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeScreenState({Key key, @required this.currentUserId});

  final String currentUserId;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool isLoading = false;
  List<Choice> choices = const <Choice>[
    const Choice(title: 'Settings', icon: Icons.settings),
    const Choice(title: 'Log out', icon: Icons.exit_to_app),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    registerNotification();
    configLocalNotification();
    _tabController = TabController(vsync: this, length: categories.length, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  void registerNotification() {
    firebaseMessaging.requestNotificationPermissions();

    firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) {
      print('onMessage: $message');
      Platform.isAndroid
          ? showNotification(message['notification'])
          : showNotification(message['aps']['alert']);
      return;
    }, onResume: (Map<String, dynamic> message) {
      print('onResume: $message');
      return;
    }, onLaunch: (Map<String, dynamic> message) {
      print('onLaunch: $message');
      return;
    });

    firebaseMessaging.getToken().then((token) {
      print('token: $token');
      FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .update({'pushToken': token});
    }).catchError((err) {
      Fluttertoast.showToast(msg: err.message.toString());
    });
  }

  void configLocalNotification() {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void onItemMenuPress(Choice choice) {
    if (choice.title == 'Log out') {
      handleSignOut();
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChatSettings()));
    }
  }

  void showNotification(message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      Platform.isAndroid ? 'com.example.levelupapp' : 'com.example.levelupapp',
      'Flutter chat demo',
      'your channel description',
      playSound: true,
      enableVibration: true,
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    print(message);
//    print(message['body'].toString());
//    print(json.encode(message));

    await flutterLocalNotificationsPlugin.show(0, message['title'].toString(),
        message['body'].toString(), platformChannelSpecifics,
        payload: json.encode(message));

//    await flutterLocalNotificationsPlugin.show(
//        0, 'plain title', 'plain body', platformChannelSpecifics,
//        payload: 'item x');
  }

  Future<bool> onBackPress() {
    openDialog();
    return Future.value(false);
  }

  Future<Null> openDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding:
                EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
            children: <Widget>[
              Container(
                color: kPrimaryColor,
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                height: 120.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.exit_to_app,
                        size: 35.0,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),
                    Text(
                      'Are you sure you want to exit?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.cancel,
                        color: kPrimaryColor,
                      ),
                      margin: EdgeInsets.only(right: 15.0),
                    ),
                    Text(
                      'Cancel',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.check_circle,
                        color: kPrimaryColor,
                      ),
                      margin: EdgeInsets.only(right: 15.0),
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          );
        })) {
      case 0:
        break;
      case 1:
        exit(0);
        break;
    }
  }

  Future<Null> handleSignOut() async {
    this.setState(() {
      isLoading = true;
    });

    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();

    this.setState(() {
      isLoading = false;
    });

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MyApp()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     home: DefaultTabController(
    //       length: categories.length,
    //       child: Scaffold(
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        bottom: TabBar(
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Colors.white),
          controller: _tabController,
          tabs: [
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  categories[0],
                  style: TextThemes.tabStyle,
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  categories[1],
                  style: TextThemes.tabStyle,
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  categories[2],
                  style: TextThemes.tabStyle,
                ),
              ),
            ),
          ],
        ),
        leading: PopupMenuButton<Choice>(
          icon: Icon(Icons.menu, size: 26.0),
          color: Colors.white,
          onSelected: onItemMenuPress,
          itemBuilder: (BuildContext context) {
            return choices.map((Choice choice) {
              return PopupMenuItem<Choice>(
                  value: choice,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        choice.icon,
                        color: kPrimaryColor,
                      ),
                      Container(
                        width: 10.0,
                      ),
                      Text(
                        choice.title,
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ],
                  ));
            }).toList();
          },
        ),
        // IconButton(
        //   icon: Icon(Icons.menu),
        //   iconSize: 26.0,
        //   color: Colors.white,
        //   onPressed: () {},
        // ),
        title: Text(
          'Level Up!',
          style: TextThemes.title,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            iconSize: 26.0,
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChatMainScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
      // body: TabBarView(
      //   children: [
      //     ListView.builder(
      //       itemCount: DemoValues.posts.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         return PostCard(postData: DemoValues.posts[index]);
      //         },
      //     ),
      //     Icon(Icons.accessibility_new),
      //     Icon(Icons.work),
      //   ],
      //        ),
      floatingActionButton: _bottomButtons(),
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
            // List
            Container(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                      ),
                    );
                  } else {
                    return TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: DemoValues.posts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return PostCard(postData: DemoValues.posts[index]);
                          },
                        ),
                        Icon(Icons.accessibility_new),
                        Icon(Icons.work),
                      ],
                    );
                  }
                },
              ),
            ),

            // Loading
            Positioned(
              child: isLoading ? const Loading() : Container(),
            )
          ],
        ),
        onWillPop: onBackPress,
      ),
      //),
      //    )
    );
  }

  Widget _bottomButtons() {
    if (_tabController.index == 0) {
      return FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: () {},
          backgroundColor: Colors.redAccent,
          tooltip: "Make a post",
          child: Icon(
            Icons.edit,
            size: 25.0,
          ));
    } else if (_tabController.index == 1) {
      return FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: () {},
          backgroundColor: Colors.redAccent,
          tooltip: "Add an article",
          child: Icon(
            Icons.add_circle_outline,
            size: 25.0,
          ));
    } else {
      return FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: () {},
          backgroundColor: Colors.redAccent,
          child: Icon(
            Icons.library_add_rounded,
            size: 25.0,
          ));
    }
  }
}
