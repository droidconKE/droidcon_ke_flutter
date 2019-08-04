import 'dart:async';
import 'dart:ui' as ui;

import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class DynamicSliver extends StatefulWidget {
  final Session session;

  const DynamicSliver({Key key, this.session}) : super(key: key);

  @override
  _DynamicSliverState createState() => _DynamicSliverState();
}

class _DynamicSliverState extends State<DynamicSliver> {
  double top = 0;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent, animate: true);
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
          floating: true,
          pinned: true,
          actions: <Widget>[PopupMenu()],
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
