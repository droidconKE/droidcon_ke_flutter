import 'package:community_material_icon/community_material_icon.dart';
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/app_drawer.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () => Navigator.of(context).pushReplacementNamed("/"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Schedule"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed("/schedule"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Speakers"),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed("/speakers"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.map),
            title: Text("Venue"),
            onTap: () => Navigator.of(context).pushReplacementNamed("/venue"),
          ),
          Divider(),
          ListTile(
            leading: Icon(CommunityMaterialIcons.puzzle),
            title: Text("Organizers"),
            onTap: () => Navigator.of(context).pushReplacementNamed("/organizers"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text("Sponsors"),
            onTap: () => Navigator.of(context).pushReplacementNamed("/sponsors"),
          ),
          Divider(),
        ],
      ),
    );
  }
}
