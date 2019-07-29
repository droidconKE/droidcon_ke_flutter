import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droidcon_ke_flutter/models/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  List<StarredSession> sessions = [];
  StreamSubscription userAuthSub;

  FavoritesProvider() {
    userAuthSub =
        FirebaseAuth.instance.onAuthStateChanged.listen((newUser) async {
      print('FavoritesProvider - FirebaseAuth - onAuthStateChanged - $newUser');
      if (newUser == null) {
        sessions = [];
        notifyListeners();
      } else {
        print("Fetching favorites");
        Firestore.instance
            .collection('starred_sessions')
            .where('user_id', isEqualTo: newUser.uid)
            .snapshots()
            .listen(((data) {
          sessions = data.documents
              .map((doc) => StarredSession.fromFirestoreDocument(doc))
              .toList();
          notifyListeners();
        }));
      }
    }, onError: (e) {
      print('AuthProvider - FirebaseAuth - onAuthStateChanged - $e');
    });
  }

  @override
  void dispose() {
    if (userAuthSub != null) {
      userAuthSub.cancel();
      userAuthSub = null;
    }
    super.dispose();
  }
}
