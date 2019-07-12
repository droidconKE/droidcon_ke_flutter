import 'package:droidcon_ke_flutter/screens/schedule_page.dart';
import 'package:droidcon_ke_flutter/screens/venue_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import 'info_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static List<Widget> _widgetOptions = <Widget>[
    InfoPage(),
    SchedulePage(),
    VenuePage(),
  ];

  bool _isDark;
  AppTheme appTheme;

  checkBrightness(BuildContext context) {
    setState(() {
      if (appTheme == null) appTheme = Provider.of<AppTheme>(context);
      _isDark = appTheme.getBrightness() == Brightness.dark;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkBrightness(context);
    FlutterStatusbarcolor.setStatusBarColor(_isDark
        ? Theme.of(context).primaryColorDark
        : Theme.of(context).primaryColor);
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      appBar: AppBar(
        title: Text(
          "Schedule",
          style: Theme.of(context).textTheme.title,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).textTheme.body1.color,
              ),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: ListTile(
                      // leading: Icon(Icons.edit),
                      onTap: () {
                        if (_isDark)
                          appTheme.setBrightness(Brightness.light);
                        else
                          appTheme.setBrightness(Brightness.dark);
                        checkBrightness(context);
                        Navigator.pop(context);
                      },
                      title: Text("${_isDark ? 'Light' : 'Dark'} Theme"),
                    ),
                  ),
                  if (user != null)
                    PopupMenuItem(
                      child: ListTile(
                        // leading: Icon(Icons.edit),
                        onTap: () {
                          _auth.signOut();
                          Navigator.pop(context);
                        },
                        title: Text("Logout"),
                      ),
                    ),
                ];
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark
            ? Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.white),
            title: Text(
              'Info',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Colors.white),
            title: Text(
              'Schedule',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop, color: Colors.white),
            title: Text(
              'Venue',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
