import 'package:cached_network_image/cached_network_image.dart';
import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakerPane extends StatelessWidget {
  final Speaker speaker;

  const SpeakerPane({Key key, this.speaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        // height: MediaQuery.of(context).size.width * .8,
        child: Card(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        CachedNetworkImageProvider(speaker.photoUrl),
                    maxRadius: 75,
                    minRadius: 50,
                  ),
                  SizedBox(height: 10),
                  Text("${speaker.name}"),
                  SizedBox(height: 10),
                  if (speaker.company != null) Text("${speaker.company ?? ''}"),
                  SizedBox(height: 10),
                  if (speaker.twitterHandle != null &&
                      speaker.twitterHandle != "") ...[
                    InkWell(
                      child: Text(
                        "@${speaker.twitterHandle}",
                        style: TextStyle(
                          color: Color(0xFF55acee),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () async {
                        String url = 'https://twitter.com/${speaker.twitterHandle}';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                  Text("${speaker.bio ?? ''}"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
