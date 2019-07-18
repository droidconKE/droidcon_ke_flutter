import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool authenticating = false;
  bool _isDark;
  AppTheme appTheme;

  checkBrightness(BuildContext context) {
    setState(() {
      if (appTheme == null) appTheme = Provider.of<AppTheme>(context);
      _isDark = appTheme.getBrightness() == Brightness.dark;
    });
  }

  setAuthenticating(bool val) {
    setState(() {
      authenticating = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    checkBrightness(context);
    return Scaffold(
      backgroundColor: !_isDark
          ? Color(0xFFFFD54F)
          : Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(_isDark ? Icons.brightness_high : Icons.brightness_3),
                  onPressed: () {
                    if (_isDark)
                      appTheme.setBrightness(Brightness.light);
                    else
                      appTheme.setBrightness(Brightness.dark);
                    checkBrightness(context);
                  },
                ),
              ],
            ),
            Image.asset(
              "assets/images/logo-name.png",
              fit: BoxFit.fitWidth,
            ),
            Text(
              "First Sub-Saharan Android Focused Developer conference",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            Divider(
              height: 100,
              color: Colors.grey,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.calendar_today),
                Expanded(
                  child: Text(
                    "August 8th - 9th 2019",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "iHub Nairobi",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            Divider(
              height: 50,
              color: Colors.grey,
            ),
            if (user == null)
              OutlineButton(
                onPressed: () async {
                  setAuthenticating(true);
                  try {
                    final GoogleSignInAccount googleUser =
                        await _googleSignIn.signIn();
                    final GoogleSignInAuthentication googleAuth =
                        await googleUser.authentication;

                    final AuthCredential credential =
                        GoogleAuthProvider.getCredential(
                      accessToken: googleAuth.accessToken,
                      idToken: googleAuth.idToken,
                    );

                    final FirebaseUser user =
                        await _auth.signInWithCredential(credential);
                  } catch (e) {} finally {
                    setAuthenticating(false);
                  }
                },
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/google-signin.png",
                      height: 15,
                    ),
                    Expanded(
                      child: Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    authenticating
                        ? SizedBox(
                            child: CircularProgressIndicator(),
                            height: 15,
                            width: 15,
                          )
                        : Container(),
                  ],
                ),
              ),
            if (user != null)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(user.displayName),
                  OutlineButton(
                    onPressed: () {
                      _auth.signOut();
                    },
                    child: Text("Logout"),
                  ),
                ],
              ),
            SizedBox(
              height: 50,
            ),
            Text(
              "\u00a9 2019 droidconKE",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
