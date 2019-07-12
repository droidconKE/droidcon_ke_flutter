library starred_session;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'starred_session.g.dart';

abstract class StarredSession
    implements Built<StarredSession, StarredSessionBuilder> {
  @nullable
  String get day;

  @nullable
  String get documentId;

  @nullable
  String get session_id;

  @nullable
  bool get starred;

  @nullable
  String get user_id;

  StarredSession._();

  factory StarredSession([updates(StarredSessionBuilder b)]) = _$StarredSession;

  String toJson() {
    return json
        .encode(serializers.serializeWith(StarredSession.serializer, this));
  }

  static StarredSession fromJson(String jsonString) {
    return serializers.deserializeWith(
        StarredSession.serializer, json.decode(jsonString));
  }

  static StarredSession fromMap(Map map) {
    return serializers.deserializeWith(StarredSession.serializer, map);
  }

  static Serializer<StarredSession> get serializer =>
      _$starredSessionSerializer;
}
