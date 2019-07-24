import 'package:droidcon_ke_flutter/providers/theme.dart';
import 'package:droidcon_ke_flutter/widgets/agenda_page.dart';
import 'package:droidcon_ke_flutter/widgets/app_drawer.dart';
import 'package:droidcon_ke_flutter/widgets/day_sessions.dart';
import 'package:droidcon_ke_flutter/widgets/popup_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with SingleTickerProviderStateMixin {

  bool _isDark;
  AppTheme appTheme;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          "Schedule",
          style: Theme.of(context).textTheme.title,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          PopupMenu(),
        ],
      ),
      body: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                  child: Text(
                "Aug 8",
                style: Theme.of(context).textTheme.body1,
              )),
              Tab(
                  child: Text(
                "Aug 9",
                style: Theme.of(context).textTheme.body1,
              )),
              Tab(
                  child: Text(
                "Agenda",
                style: Theme.of(context).textTheme.body1,
              )),
            ],
            indicatorColor: Theme.of(context).primaryColor,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: TabBarView(
                controller: _tabController,
                children: [
                  DaySessions(day: 'day_one'),
                  DaySessions(day: 'day_two'),
                  AgendaPage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
