import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/providers/theme.dart';
import 'package:droidcon_ke_flutter/widgets/app_drawer.dart';
import 'package:droidcon_ke_flutter/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class OrganizersPage extends StatefulWidget {
  @override
  _OrganizersPageState createState() => _OrganizersPageState();
}

class _OrganizersPageState extends State<OrganizersPage> {
  final db = Firestore.instance;
  AppTheme appTheme;
  bool _isDark;
  final StreamController<QuerySnapshot> streamController =
      StreamController<QuerySnapshot>.broadcast();

  @override
  void initState() {
    streamController
        .addStream(db.collection('organizers').getDocuments().asStream());
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
        title: Text("Organizers"),
        backgroundColor:
            _isDark ? Colors.transparent : Theme.of(context).primaryColor,
        //elevation: 0,
        actions: <Widget>[
          PopupMenu(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: StreamBuilder<QuerySnapshot>(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Organizer> organizers = snapshot.data.documents
                  .map((doc) => Organizer.fromMap(doc.data))
                  .toList()
                    ..sort((a, b) =>
                        a.name.toLowerCase().compareTo(b.name.toLowerCase()));
              print(organizers[0]);
              return Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: _isDark
                          ? Color.fromRGBO(255, 255, 255, .2)
                          : Color.fromRGBO(0, 0, 0, .2),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    padding: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CachedNetworkImage(
                            // imageUrl: organizers[index].logoUrl,
                            imageUrl:
                                'https://droidcon.co.ke/assets/img/about-logo.png',
                            height: 150,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${organizers[index].name}",
                            style: Theme.of(context).textTheme.title,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (organizers[index].site != null &&
                              organizers[index].site != "") ...[
                            InkWell(
                              child: Text(
                                "${organizers[index].site}",
                                style: TextStyle(
                                  color: Color(0xFF55acee),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () async {
                                String url = '${organizers[index].site}';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                            SizedBox(height: 10),
                          ],
                          Text(
                            "${organizers[index].bio ?? ''}",
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: organizers.length,
                viewportFraction: 0.8,
                scale: 0.9,
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
