import 'dart:async';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/providers/favorites_provider.dart';
import 'package:droidcon_ke_flutter/widgets/popup_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';

class DynamicSliver extends StatefulWidget {
  final Session session;

  const DynamicSliver({Key key, this.session}) : super(key: key);

  @override
  _DynamicSliverState createState() => _DynamicSliverState();
}

class _DynamicSliverState extends State<DynamicSliver> {
  double top = 0;
  List<StarredSession> favorites;
  bool _isFavorite;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent, animate: true);
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    favorites = Provider.of<FavoritesProvider>(context).sessions;
    _isFavorite = favorites
        .where((fav) => fav.starred && fav.day == widget.session.day_number)
        .map((fav) => fav.session_id)
        .contains(widget.session.id);
    Image image = Image.network(widget.session.photoUrl);
    // Image image = CachedNetworkImage(imageUrl: widget.session.photoUrl).;
    Completer<ui.Image> completer = Completer<ui.Image>();
    image.image
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    }));
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return FutureBuilder(
      future: completer.future,
      builder: (context, AsyncSnapshot<ui.Image> snapshot) {
        double _height = snapshot.hasData
            ? MediaQuery.of(context).size.width /
                    snapshot.data.width.toDouble() *
                    snapshot.data.height.toDouble() -
                statusBarHeight
            : 0.0;
        return SliverAppBar(
          floating: false,
          pinned: true,
          actions: <Widget>[
            IconButton(
              icon: AnimatedSwitcher(
                child: Icon(_isFavorite ? Icons.star : Icons.star_border,
                    key: ValueKey<bool>(_isFavorite)),
                duration: const Duration(milliseconds: 100),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  final scaleTransition =
                  Tween<double>(begin: 2, end: 1).animate(animation);
                  return ScaleTransition(
                    child: child,
                    scale: scaleTransition,
                  );
                },
              ),
              onPressed: () async {
                var matchingDocs = favorites
                    .where((fav) =>
                fav.day == widget.session.day_number &&
                    fav.session_id == widget.session.id)
                    .toList();
                var starredSession =
                matchingDocs.length > 0 ? matchingDocs[0] : null;
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
            PopupMenu(),
          ],
          expandedHeight: snapshot.hasData
              ? MediaQuery.of(context).size.width /
                      snapshot.data.width.toDouble() *
                      snapshot.data.height.toDouble() -
                  statusBarHeight
              : 0.0,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                background: Image.network(
                  "${widget.session.photoUrl}",
                  fit: BoxFit.fitWidth,
                ),
                collapseMode: CollapseMode.parallax,
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: top == 80.0 ? 1.0 : 0.0,
                  child: Text(
                    "${widget.session.title}",
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
