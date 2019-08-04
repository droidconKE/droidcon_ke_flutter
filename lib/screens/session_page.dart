import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:droidcon_ke_flutter/utils/hex_color.dart';
import 'package:droidcon_ke_flutter/widgets/dynamic_sliver.dart';
import 'package:droidcon_ke_flutter/widgets/speaker_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class SessionPage extends StatefulWidget {
  final String documentId;
  final Session session;

  const SessionPage({Key key, this.session, this.documentId}) : super(key: key);

  @override
  _SessionPageState createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent, animate: true);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          DynamicSliver(
            session: widget.session,
          ),
          SliverFillRemaining(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: widget.session.speaker_id
                            .map((i) => SpeakerAvatar(
                                  speakerId: i,
                                ))
                            .toList(),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.session.room,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.session.time_in_am,
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            widget.session.duration,
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
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
                      Chip(label: Text("${widget.session.session_audience}")),
                    ],
                  ),
                  Divider(),
                  Text(
                    widget.session.description,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    print("Brightness changed");
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent, animate: true);
    super.didChangePlatformBrightness();
  }
}
