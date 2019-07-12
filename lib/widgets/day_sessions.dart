import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/widgets/session_tile.dart';
import 'package:flutter/material.dart';
import '../models/index.dart';

class DaySessions extends StatefulWidget {
  final String day;

  const DaySessions({Key key, this.day}) : super(key: key);

  @override
  _DaySessionsState createState() => _DaySessionsState();
}

class _DaySessionsState extends State<DaySessions> {
  final db = Firestore.instance;
  final StreamController<QuerySnapshot> streamController = StreamController<QuerySnapshot>.broadcast();


  @override
  void initState() {
    streamController.addStream(db.collection(widget.day).orderBy("time_in_am").getDocuments().asStream());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: streamController.stream,
      builder: (context,
          AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              Session session = Session.fromMap(snapshot.data.documents[index].data);
              return SessionTile(session: session);
            },
          );
        }
        if(snapshot.hasError){
          print(snapshot.error);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
