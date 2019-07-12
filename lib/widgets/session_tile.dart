import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/utils/hex_color.dart';
import 'package:flutter/material.dart';

class SessionTile extends StatefulWidget {
  final Session session;

  const SessionTile({Key key, this.session}) : super(key: key);

  @override
  _SessionTileState createState() => _SessionTileState();
}

class _SessionTileState extends State<SessionTile> {
  @override
  Widget build(BuildContext context) {
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
        ),
        Divider(),
      ],
    );
    ;
  }
}
