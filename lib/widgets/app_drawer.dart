import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("${user?.photoUrl}"),
            ),
            accountName: Text("${user?.displayName}"),
            accountEmail: Text("${user?.email}"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () => Navigator.of(context).pushReplacementNamed("/"),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Schedule"),
            onTap: () => Navigator.of(context).pushReplacementNamed("/schedule"),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Speakers"),
            onTap: () => Navigator.of(context).pushReplacementNamed("/speakers"),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Venue"),
            onTap: () => Navigator.of(context).pushReplacementNamed("/venue"),
          ),
        ],
      ),
    );
  }
}
