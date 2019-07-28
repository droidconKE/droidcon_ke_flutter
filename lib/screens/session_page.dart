import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/widgets/popup_menu.dart';
import 'package:flutter/material.dart';

class SessionPage extends StatefulWidget {
  final Session session;

  const SessionPage({Key key, this.session}) : super(key: key);

  @override
  _SessionPageState createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.session.title}"),
        actions: <Widget>[
          PopupMenu(),
        ],
      ),
    );
  }
}
