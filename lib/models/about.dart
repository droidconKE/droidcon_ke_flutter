library about;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'serializers.dart';

part 'about.g.dart';

abstract class About implements Built<About, AboutBuilder> {
  @nullable
  String get documentID;

  @nullable
  int get id;

  @nullable
  String get name;

  @nullable
  String get bio;

  @nullable
  String get logoUrl;

  About._();

  factory About([updates(AboutBuilder b)]) = _$About;

  String toJson() {
    return json.encode(serializers.serializeWith(About.serializer, this));
  }

  static About fromJson(String jsonString) {
    return serializers.deserializeWith(
        About.serializer, json.decode(jsonString));
  }

  static About fromFirestoreDocument(DocumentSnapshot document) {
    return About.fromMap(document.data)
        .rebuild((b) => b..documentID = document.documentID);
  }

  static About fromMap(Map map) {
    return serializers.deserializeWith(About.serializer, map);
  }

  static Serializer<About> get serializer => _$aboutSerializer;
}
