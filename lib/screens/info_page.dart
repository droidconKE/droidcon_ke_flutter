import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  bool _isDark;
  AppTheme appTheme;

  checkBrightness(BuildContext context) {
    setState(() {
      if (appTheme == null) appTheme = Provider.of<AppTheme>(context);
      _isDark = appTheme.getTheme().brightness == Brightness.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkBrightness(context);
    return Center(
      child: Container(
        height: 100,
        child: Column(
          children: <Widget>[
            Text(
              'Info',
            ),
            OutlineButton(
              onPressed: () {
                if (_isDark)
                  appTheme.setTheme(ThemeData.light());
                else
                  appTheme.setTheme(ThemeData.dark());
                checkBrightness(context);
              },
              child: Text("${_isDark ? 'Light' : 'Dark'} Theme"),
            ),
            /*Switch(
              value: _isDark,
              onChanged: (value) {
                print("Tring to change theme...: $_isDark");
                if (value)
                  appTheme.setTheme(ThemeData.light());
                else
                  appTheme.setTheme(ThemeData.dark());
                checkBrightness(context);
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
