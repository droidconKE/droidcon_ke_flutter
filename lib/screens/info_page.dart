import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/providers/theme.dart';
import 'package:droidcon_ke_flutter/widgets/app_drawer.dart';
import 'package:droidcon_ke_flutter/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final db = Firestore.instance;
  AppTheme appTheme;
  bool _isDark;
  final StreamController<QuerySnapshot> streamController =
      StreamController<QuerySnapshot>.broadcast();

  @override
  void initState() {
    streamController.addStream(
        db.collection('about_droidconKE').limit(1).getDocuments().asStream());
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
        title: Text("Home"),
        backgroundColor:
            _isDark ? Colors.transparent : Theme.of(context).primaryColor,
        actions: <Widget>[
          PopupMenu(),
        ],
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  About about =
                      About.fromFirestoreDocument(snapshot.data.documents[0]);
                  return Column(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: about.logoUrl,
                        fit: BoxFit.fitWidth,
                      ),
                      Container(
                        child: Column(children: <Widget>[
                          Text(
                            "Welcome to DroidConKE",
                            style: Theme.of(context).textTheme.title,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(about.bio),
                        ]),
                        padding: EdgeInsets.all(25),
                      ),
                    ],
                  );
                }
                return Center(child: Text("Info"));
              }),
          Expanded(
            child: GridView.count(
              primary: true,
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20,
              crossAxisCount: 3,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushReplacementNamed("/schedule"),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.access_time),
                        Text(
                          "Schedule",
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed("/speakers"),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.people),
                        Text(
                          "Speakers",
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed("/venue"),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.map),
                        Text(
                          "Venue",
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
