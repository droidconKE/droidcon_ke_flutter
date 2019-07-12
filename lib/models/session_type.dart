library session_type;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'session_type.g.dart';

abstract class SessionType implements Built<SessionType, SessionTypeBuilder> {
  @nullable
  int get id;

  @nullable
  String get name;

  SessionType._();

  factory SessionType([updates(SessionTypeBuilder b)]) = _$SessionType;

  String toJson() {
    return json.encode(serializers.serializeWith(SessionType.serializer, this));
  }

  static SessionType fromJson(String jsonString) {
    return serializers.deserializeWith(
        SessionType.serializer, json.decode(jsonString));
  }

  static SessionType fromMap(Map map) {
    return serializers.deserializeWith(SessionType.serializer, map);
  }

  static Serializer<SessionType> get serializer => _$sessionTypeSerializer;
}
