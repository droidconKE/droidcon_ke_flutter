import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/widgets/speaker_pane.dart';
import 'package:flutter/material.dart';

class SpeakerAvatar extends StatefulWidget {
  final int speakerId;

  const SpeakerAvatar({Key key, this.speakerId}) : super(key: key);

  @override
  _SpeakerAvatarState createState() => _SpeakerAvatarState();
}

class _SpeakerAvatarState extends State<SpeakerAvatar> {
  Speaker _speaker;
  final db = Firestore.instance;
  final StreamController<QuerySnapshot> streamController =
      StreamController<QuerySnapshot>.broadcast();

  @override
  void initState() {
    streamController.addStream(db
        .collection('speakers')
        .where('id', isEqualTo: widget.speakerId)
        .limit(1)
        .getDocuments()
        .asStream());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _speaker = Speaker.fromMap(snapshot.data.documents[0].data);
            return InkWell(
              child: Container(
                margin: EdgeInsets.only(right: 5),
                child: CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(_speaker.photoUrl),
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => SpeakerPane(speaker: _speaker),
                );
              },
            );
          }
          return CircularProgressIndicator();
        });
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
