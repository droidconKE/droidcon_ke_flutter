import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/utils/hex_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionTile extends StatefulWidget {
  final Session session;
  final List<StarredSession> favorites;

  const SessionTile({Key key, this.session, this.favorites}) : super(key: key);

  @override
  _SessionTileState createState() => _SessionTileState();
}

class _SessionTileState extends State<SessionTile> {
  bool _isFavorite;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    _isFavorite = widget.favorites
        .where((fav) => fav.starred && fav.day == widget.session.day_number)
        .map((fav) => fav.session_id)
        .contains(widget.session.id);

    return Column(
      children: <Widget>[
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("${widget.session.title}",
                  style: Theme.of(context).textTheme.title),
              Text(
                  "${widget.session.duration} / ${widget.session.room} / ${widget.session.time_in_am} ${widget.session.am_pm_label}")
            ],
          ),
          subtitle: Row(
            children: <Widget>[
              Container(
                height: 10,
                width: 10,
                color: HexColor(widget.session.session_color),
                margin: EdgeInsets.only(right: 10),
              ),
              Text("${widget.session.type}"),
            ],
          ),
          trailing: IconButton(
            icon: Icon(_isFavorite ? Icons.star : Icons.star_border),
            onPressed: () async {
              var matchingDocs = widget.favorites.where((fav) =>
              fav.day == widget.session.day_number &&
                  fav.session_id == widget.session.id).toList();
              var starredSession = matchingDocs.length > 0? matchingDocs[0] : null;
              if (!_isFavorite && starredSession == null) {
                var starred = StarredSession.fromMap({
                  'day': widget.session.day_number,
                  'session_id': widget.session.id,
                  'starred': true,
                  'user_id': user.uid,
                });
                Firestore.instance
                    .collection('starred_sessions')
                    .add(starred.toMap());
              } else {
                  await Firestore.instance
                      .document("/starred_sessions/${starredSession.documentId}")
                      .updateData({'starred': !_isFavorite});
              }
            },
          ),
        ),
        Divider(),
      ],
    );
    ;
  }
}
