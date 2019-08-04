import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/providers/theme.dart';
import 'package:droidcon_ke_flutter/widgets/app_drawer.dart';
import 'package:droidcon_ke_flutter/widgets/popup_menu.dart';
import 'package:droidcon_ke_flutter/widgets/speaker_pane.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpeakersPage extends StatefulWidget {
  @override
  _SpeakersPageState createState() => _SpeakersPageState();
}

class _SpeakersPageState extends State<SpeakersPage> {
  final db = Firestore.instance;
  AppTheme appTheme;
  bool _isDark;
  final StreamController<QuerySnapshot> streamController =
      StreamController<QuerySnapshot>.broadcast();

  @override
  void initState() {
    streamController
        .addStream(db.collection('speakers').getDocuments().asStream());
    super.initState();
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
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Speakers"),
        backgroundColor:
            _isDark ? Colors.transparent : Theme.of(context).primaryColor,
        actions: <Widget>[
          PopupMenu(),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Speaker> speakers = snapshot.data.documents
                .map((doc) => Speaker.fromMap(doc.data))
                .toList()
                  ..sort((a, b) =>
                      a.name.toLowerCase().compareTo(b.name.toLowerCase()));
            return ListView.builder(
              itemCount: speakers.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          speakers[index].photoUrl,
                        ),
                      ),
                      title: Text("${speakers[index].name}"),
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) =>
                              SpeakerPane(speaker: speakers[index]),
                        );
                      },
                    ),
                    Divider(),
                  ],
                );
              },
            );
          }
          if (snapshot.hasError) return Text("${snapshot.error.toString()}");
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
