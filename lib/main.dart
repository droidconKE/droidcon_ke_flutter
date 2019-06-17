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
            value: AppTheme(ThemeData.light())),
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
    return MaterialApp(
      title: "DroidcoKE",
      theme: Provider.of<AppTheme>(context).getTheme(),
      home: WelcomePage(),
    );
  }
}
