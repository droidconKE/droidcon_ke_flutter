library speaker;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'speaker.g.dart';

abstract class Speaker implements Built<Speaker, SpeakerBuilder> {
  @nullable
  String get bio;

  @nullable
  String get company;

  @nullable
  String get name;

  @nullable
  String get photoUrl;

  @nullable
  String get twitterHandle;

  @nullable
  int get id;

  Speaker._();

  factory Speaker([updates(SpeakerBuilder b)]) = _$Speaker;

  String toJson() {
    return json.encode(serializers.serializeWith(Speaker.serializer, this));
  }

  static Speaker fromJson(String jsonString) {
    return serializers.deserializeWith(
        Speaker.serializer, json.decode(jsonString));
  }

  static Speaker fromMap(Map map) {
    return serializers.deserializeWith(Speaker.serializer, map);
  }

  static Serializer<Speaker> get serializer => _$speakerSerializer;
}
