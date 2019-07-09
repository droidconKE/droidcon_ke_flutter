import 'package:droidcon_ke_flutter/screens/schedule_page.dart';
import 'package:droidcon_ke_flutter/screens/venue_page.dart';
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
  static List<Widget> _widgetOptions = <Widget>[
    InfoPage(),
    SchedulePage(),
    VenuePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Provider.of<AppTheme>(context).getBrightness();
    FlutterStatusbarcolor.setStatusBarColor(brightness == Brightness.light ? Theme.of(context).primaryColor : Theme.of(context).primaryColorDark);
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: brightness == Brightness.light ? Theme.of(context).primaryColor : Theme.of(context).primaryColorDark,
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
