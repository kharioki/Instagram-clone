import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/notifications.dart';
import 'pages/profile.dart';
import 'pages/search.dart';
import 'pages/create_post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    CreatePostPage(),
    NotificationsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Instagram',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: TabBarView(
          children: pages,
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.search),
              ),
              Tab(
                icon: Icon(Icons.add_circle_outline),
              ),
              Tab(
                icon: Icon(Icons.notifications),
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
              ),
            ],
            unselectedLabelColor: Colors.black,
            labelColor: Colors.pinkAccent,
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
