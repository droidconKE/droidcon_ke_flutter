library session_feedback;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'session_feedback.g.dart';

abstract class SessionFeedback
    implements Built<SessionFeedback, SessionFeedbackBuilder> {
  @nullable
  String get day_number;

  @nullable
  String get session_feedback;

  @nullable
  String get session_id;

  @nullable
  String get session_title;

  @nullable
  String get user_id;

  SessionFeedback._();

  factory SessionFeedback([updates(SessionFeedbackBuilder b)]) =
      _$SessionFeedback;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SessionFeedback.serializer, this));
  }

  static SessionFeedback fromJson(String jsonString) {
    return serializers.deserializeWith(
        SessionFeedback.serializer, json.decode(jsonString));
  }

  static SessionFeedback fromMap(Map map) {
    return serializers.deserializeWith(SessionFeedback.serializer, map);
  }

  static Serializer<SessionFeedback> get serializer =>
      _$sessionFeedbackSerializer;
}
