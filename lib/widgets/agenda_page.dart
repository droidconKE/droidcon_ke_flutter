import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/utils/hex_color.dart';
import 'package:droidcon_ke_flutter/utils/time.dart';
import 'package:flutter/material.dart';

class AgendaPage extends StatefulWidget {
  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  final db = Firestore.instance;
  final StreamController<QuerySnapshot> streamController =
      StreamController<QuerySnapshot>.broadcast();

  @override
  void initState() {
    streamController
        .addStream(db.collection("agenda").getDocuments().asStream());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: streamController.stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<Agenda> agenda = snapshot.data.documents
              .map((doc) => Agenda.fromMap(doc.data))
              .toList()
              ..sort((a, b) {
                return stringToTimeOfDay(a.time).toString().compareTo(stringToTimeOfDay(b.time).toString());
              });
          return ListView.builder(
            itemCount: agenda.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Container(
                    color: HexColor(agenda[index].background_color),
                    child: ListTile(
                      leading: Image.network(agenda[index].iconUrl),
                      title: Text("${agenda[index].title}"),
                      subtitle: Text("${agenda[index].time}"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
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
