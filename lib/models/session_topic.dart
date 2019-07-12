library session_topic;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'session_topic.g.dart';

abstract class SessionTopic
    implements Built<SessionTopic, SessionTopicBuilder> {
  @nullable
  int get id;

  @nullable
  String get name;

  SessionTopic._();

  factory SessionTopic([updates(SessionTopicBuilder b)]) = _$SessionTopic;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SessionTopic.serializer, this));
  }

  static SessionTopic fromJson(String jsonString) {
    return serializers.deserializeWith(
        SessionTopic.serializer, json.decode(jsonString));
  }

  static SessionTopic fromMap(Map map) {
    return serializers.deserializeWith(SessionTopic.serializer, map);
  }

  static Serializer<SessionTopic> get serializer => _$sessionTopicSerializer;
}
