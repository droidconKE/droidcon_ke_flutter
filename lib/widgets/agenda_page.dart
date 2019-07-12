import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/utils/hex_color.dart';
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
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              Agenda agenda =
                  Agenda.fromMap(snapshot.data.documents[index].data);
              return Column(
                children: <Widget>[
                  Container(
                    color: HexColor(agenda.background_color),
                    child: ListTile(
                      leading: Image.network(agenda.iconUrl),
                      title: Text("${agenda.title}"),
                      subtitle: Text("${agenda.time}"),
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
