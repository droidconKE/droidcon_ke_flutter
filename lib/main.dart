import 'package:droidcon_ke_flutter/screens/home_page.dart';
import 'package:droidcon_ke_flutter/screens/welcome_page.dart';
import 'package:droidcon_ke_flutter/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(DroidconKeApp());

class DroidconKeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppTheme>.value(
            value: AppTheme(Brightness.light)),
        StreamProvider<FirebaseUser>.value(
            value: FirebaseAuth.instance.onAuthStateChanged)
      ],
      child: MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    Brightness brightness = Provider.of<AppTheme>(context).getBrightness();
    return MaterialApp(
      title: "DroidcoKE",
      theme: ThemeData(
        primaryColor: Colors.purple,
        primaryColorDark: Colors.black,
        brightness: brightness,
      ),
      home: (user == null) ? WelcomePage() : HomePage(),
    );
  }
}
