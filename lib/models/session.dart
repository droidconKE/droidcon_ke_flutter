library session;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'session.g.dart';

abstract class Session implements Built<Session, SessionBuilder> {
  int get id;

  String get am_pm_label;

  String get day_number;

  String get description;

  String get duration;

  String get notification_slug;

  String get photoUrl;

  String get room;

  @nullable
  int get room_id;

  String get session_audience;

  String get session_color;

  BuiltList<int> get speaker_id;

  String get time;

  String get time_in_am;

  String get title;

  String get topic;

  String get type;

  String get url;

  Session._();

  factory Session([updates(SessionBuilder b)]) = _$Session;

  String toJson() {
    return json.encode(serializers.serializeWith(Session.serializer, this));
  }

  static Session fromJson(String jsonString) {
    return serializers.deserializeWith(
        Session.serializer, json.decode(jsonString));
  }

  static Session fromMap(Map map) {
    return serializers.deserializeWith(Session.serializer, map);
  }

  static Serializer<Session> get serializer => _$sessionSerializer;
}
