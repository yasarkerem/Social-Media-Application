import 'package:egemmmm/pages/upload_posts.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/pages/feed.dart';
import 'package:egemmmm/pages/otherProfiles.dart';
import 'package:egemmmm/pages/profilePage.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/pages/search.dart';
final scakey = new GlobalKey<_MyStatefulWidgetState>();

/// This Widget is the main application widget.
class MyApp1 extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {'/otherProfile': (context) => otherProfile(),
        },
      title: _title,
      home: MyStatefulWidget(key: scakey),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  final myKey = new GlobalKey<_MyStatefulWidgetState>();

  List<Widget> _widgetOptions = <Widget>[
    feed(),
    search(),
    Upload(),
    profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed_sharp, color: Appcolors.highlight),
            // ignore: deprecated_member_use
            title: Text('Feed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Appcolors.highlight),
            // ignore: deprecated_member_use
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined, color: Appcolors.highlight),
            // ignore: deprecated_member_use
            title: Text('Post'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Appcolors.highlight),
            // ignore: deprecated_member_use
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Appcolors.NavigatorColor,
        onTap: _onItemTapped,
      ),



    );
  }
}


