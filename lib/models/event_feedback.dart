library event_feedback;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'event_feedback.g.dart';

abstract class EventFeedback
    implements Built<EventFeedback, EventFeedbackBuilder> {
  @nullable
  String get eventFeedback;

  EventFeedback._();

  factory EventFeedback([updates(EventFeedbackBuilder b)]) = _$EventFeedback;

  String toJson() {
    return json
        .encode(serializers.serializeWith(EventFeedback.serializer, this));
  }

  static EventFeedback fromJson(String jsonString) {
    return serializers.deserializeWith(
        EventFeedback.serializer, json.decode(jsonString));
  }

  static EventFeedback fromMap(Map map) {
    return serializers.deserializeWith(EventFeedback.serializer, map);
  }

  static Serializer<EventFeedback> get serializer => _$eventFeedbackSerializer;
}
