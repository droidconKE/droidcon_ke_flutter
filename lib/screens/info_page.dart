import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/widgets/app_drawer.dart';
import 'package:droidcon_ke_flutter/widgets/popup_menu.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final db = Firestore.instance;
  final StreamController<QuerySnapshot> streamController =
      StreamController<QuerySnapshot>.broadcast();

  @override
  void initState() {
    streamController.addStream(
        db.collection('about_droidconKE').limit(1).getDocuments().asStream());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Info"),
        actions: <Widget>[
          PopupMenu(),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              About about =
                  About.fromFirestoreDocument(snapshot.data.documents[0]);
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      about.logoUrl,
                      width: 200,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(about.bio),
                  ],
                ),
              );
            }
            return Center(child: Text("Info"));
          }),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
