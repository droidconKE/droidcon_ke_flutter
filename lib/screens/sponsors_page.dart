import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/providers/theme.dart';
import 'package:droidcon_ke_flutter/widgets/app_drawer.dart';
import 'package:droidcon_ke_flutter/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SponsorsPage extends StatefulWidget {
  @override
  _SponsorsPageState createState() => _SponsorsPageState();
}

class _SponsorsPageState extends State<SponsorsPage> {
  final db = Firestore.instance;
  AppTheme appTheme;
  bool _isDark;
  final StreamController<QuerySnapshot> streamController =
      StreamController<QuerySnapshot>.broadcast();

  @override
  void initState() {
    streamController
        .addStream(db.collection('sponsors').getDocuments().asStream());
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
        title: Text("Sponsors"),
        backgroundColor:
            _isDark ? Colors.transparent : Theme.of(context).primaryColor,
        //elevation: 0,
        actions: <Widget>[
          PopupMenu(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: StreamBuilder<QuerySnapshot>(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Sponsor> sponsors = snapshot.data.documents
                  .map((doc) => Sponsor.fromMap(doc.data))
                  .toList()
                    ..sort((a, b) =>
                        a.name.toLowerCase().compareTo(b.name.toLowerCase()));
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ...sponsors
                        .map((sponsor) => Card(
                              elevation: 10,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      imageUrl: "${sponsor.logoUrl}",
                                      height: 200,
                                    ),
                                    // Text("${sponsor.name}", style: Theme.of(context).textTheme.title),
                                    Text("${sponsor.bio}"),
                                  ],
                                ),
                              ),
                            ))
                        .toList()
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
