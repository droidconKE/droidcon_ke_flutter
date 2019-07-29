import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/providers/favorites_provider.dart';
import 'package:droidcon_ke_flutter/widgets/session_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/index.dart';

class DaySessions extends StatefulWidget {
  final String day;

  const DaySessions({Key key, this.day}) : super(key: key);

  @override
  _DaySessionsState createState() => _DaySessionsState();
}

class _DaySessionsState extends State<DaySessions> {
  final db = Firestore.instance;
  final StreamController<QuerySnapshot> streamController =
      StreamController<QuerySnapshot>.broadcast();
  List<StarredSession> favorites;

  @override
  void initState() {
    streamController.addStream(db
        .collection(widget.day)
        .orderBy("time_in_am")
        .getDocuments()
        .asStream());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    favorites = Provider.of<FavoritesProvider>(context).sessions;
    return StreamBuilder(
      stream: streamController.stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<Session> sessions = snapshot.data.documents
              .map((doc) => Session.fromMap(doc.data))
              .toList()
                ..sort((a, b) {
                  var aHour = int.parse(a.time_in_am.split(":")[0].trim());
                  var aTime = TimeOfDay(
                      hour: aHour +
                          (a.am_pm_label.toLowerCase().contains("pm") &&
                                  aHour != 12
                              ? 12
                              : 0),
                      minute: int.parse(a.time_in_am.split(":")[1].trim()));
                  var bHour = int.parse(b.time_in_am.split(":")[0].trim());
                  var bTime = TimeOfDay(
                      hour: bHour +
                          (b.am_pm_label.toLowerCase().contains("pm") &&
                                  bHour != 12
                              ? 12
                              : 0),
                      minute: int.parse(b.time_in_am.split(":")[1].trim()));
                  return aTime.toString().compareTo(bTime.toString());
                });
          return ListView.builder(
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              return SessionTile(
                  session: sessions[index], favorites: favorites);
            },
          );
        }
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
