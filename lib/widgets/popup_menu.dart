import 'package:droidcon_ke_flutter/providers/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';


class PopupMenu extends StatefulWidget {
  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  bool _isDark;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AppTheme appTheme;

  checkBrightness(BuildContext context) {
    setState(() {
      if (appTheme == null) appTheme = Provider.of<AppTheme>(context);
      _isDark = appTheme.getBrightness() == Brightness.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkBrightness(context);
    FlutterStatusbarcolor.setStatusBarColor(_isDark
        ? Theme.of(context).primaryColorDark
        : Theme.of(context).primaryColor);
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    return PopupMenuButton(
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
      },
    );
  }
}
