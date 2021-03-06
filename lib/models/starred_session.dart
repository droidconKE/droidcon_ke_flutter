library starred_session;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'serializers.dart';

part 'starred_session.g.dart';

abstract class StarredSession
    implements Built<StarredSession, StarredSessionBuilder> {
  @nullable
  String get day;

  @nullable
  String get documentId;

  @nullable
  int get session_id;

  @nullable
  bool get starred;

  @nullable
  String get user_id;

  StarredSession._();

  factory StarredSession([updates(StarredSessionBuilder b)]) = _$StarredSession;

  static StarredSession fromFirestoreDocument(DocumentSnapshot document) {
    return StarredSession.fromMap(document.data)
        .rebuild((b) => b..documentId = document.documentID);
  }

  static StarredSession fromJson(String jsonString) {
    return serializers.deserializeWith(
        StarredSession.serializer, json.decode(jsonString));
  }

  static StarredSession fromMap(Map map) {
    return serializers.deserializeWith(StarredSession.serializer, map);
  }

  String toJson() {
    return json
        .encode(serializers.serializeWith(StarredSession.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(StarredSession.serializer, this);
  }

  static Serializer<StarredSession> get serializer =>
      _$starredSessionSerializer;
}
