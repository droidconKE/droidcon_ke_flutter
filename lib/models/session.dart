library session;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'session.g.dart';

abstract class Session implements Built<Session, SessionBuilder> {
  @nullable
  int get id;

  @nullable
  String get am_pm_label;

  @nullable
  String get day_number;

  @nullable
  String get description;

  @nullable
  String get duration;

  @nullable
  String get notification_slug;

  @nullable
  String get photoUrl;

  @nullable
  String get room;

  @nullable
  int get room_id;

  @nullable
  String get session_audience;

  @nullable
  String get session_color;

  @nullable
  BuiltList<int> get speaker_id;

  @nullable
  String get time;

  @nullable
  String get time_in_am;

  @nullable
  String get title;

  @nullable
  String get topic;

  @nullable
  String get type;

  @nullable
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
