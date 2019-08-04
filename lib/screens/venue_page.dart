import 'dart:async';

import 'package:droidcon_ke_flutter/providers/theme.dart';
import 'package:droidcon_ke_flutter/widgets/app_drawer.dart';
import 'package:droidcon_ke_flutter/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class VenuePage extends StatefulWidget {
  @override
  _VenuePageState createState() => _VenuePageState();
}

class _VenuePageState extends State<VenuePage> {
  Completer<GoogleMapController> _controller = Completer();
  static final LatLng ihubPosition = LatLng(-1.289214, 36.783182);
  AppTheme appTheme;
  bool _isDark;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: ihubPosition,
    zoom: 14.4746,
  );

  @override
  void initState() {
    requestLocationPermissions();
    super.initState();
  }

  requestLocationPermissions() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.location]);
    }
  }

  checkBrightness(BuildContext context) {
    setState(() {
      if (appTheme == null) appTheme = Provider.of<AppTheme>(context);
      _isDark = appTheme.getBrightness() == Brightness.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkBrightness(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor:
            _isDark ? Colors.transparent : Theme.of(context).primaryColor,
        title: Text("Venue"),
        actions: <Widget>[
          PopupMenu(),
        ],
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: true,
        markers: Set.of([
          Marker(
            markerId: MarkerId("ihub"),
            position: ihubPosition,
          ),
        ]),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: Text('Take me there'),
        icon: Icon(Icons.directions),
      ),*/
    );
  }
}
