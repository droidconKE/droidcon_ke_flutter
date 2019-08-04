import 'package:droidcon_ke_flutter/providers/favorites_provider.dart';
import 'package:droidcon_ke_flutter/providers/theme.dart';
import 'package:droidcon_ke_flutter/screens/info_page.dart';
import 'package:droidcon_ke_flutter/screens/schedule_page.dart';
import 'package:droidcon_ke_flutter/screens/speakers_page.dart';
import 'package:droidcon_ke_flutter/screens/venue_page.dart';
import 'package:droidcon_ke_flutter/screens/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(DroidconKeApp());

class DroidconKeApp extends StatelessWidget {
  final appTheme = AppTheme(Brightness.light);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppTheme>.value(
          value: appTheme,
        ),
        ChangeNotifierProvider<FavoritesProvider>(
          builder: (context) => FavoritesProvider(),
        ),
        StreamProvider<FirebaseUser>.value(
          value: FirebaseAuth.instance.onAuthStateChanged,
        )
      ],
      child: MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    /*Brightness brightness = Provider.of<AppTheme>(context).getBrightness();*/
    return MaterialApp(
      title: "DroidconKE",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        primaryColorDark: Colors.black,
        brightness: Provider.of<AppTheme>(context).getBrightness(),
      ),
      home: (user == null) ? WelcomePage() : SchedulePage(),
      initialRoute: "/",
      routes: {
        '/info': (context) => InfoPage(),
        '/venue': (context) => VenuePage(),
        '/speakers': (context) => SpeakersPage(),
      },
    );
  }
}
