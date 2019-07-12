library event_type;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'event_type.g.dart';

abstract class EventType implements Built<EventType, EventTypeBuilder> {
  @nullable
  String get description;

  @nullable
  String get eventImageUrl;

  @nullable
  int get id;

  @nullable
  String get name;

  EventType._();

  factory EventType([updates(EventTypeBuilder b)]) = _$EventType;

  String toJson() {
    return json.encode(serializers.serializeWith(EventType.serializer, this));
  }

  static EventType fromJson(String jsonString) {
    return serializers.deserializeWith(
        EventType.serializer, json.decode(jsonString));
  }

  static EventType fromMap(Map map) {
    return serializers.deserializeWith(EventType.serializer, map);
  }

  static Serializer<EventType> get serializer => _$eventTypeSerializer;
}
