import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      body: Center(
        child: (user == null)
            ? OutlineButton.icon(
                onPressed: () async {
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
                },
                icon: Icon(Icons.face),
                label: Text("SignIn with Google"))
            : Column(
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
      ),
    );
  }
}
