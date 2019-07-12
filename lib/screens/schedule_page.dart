
import 'package:droidcon_ke_flutter/widgets/agenda_page.dart';
import 'package:flutter/material.dart';

import '../widgets/day_sessions.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
