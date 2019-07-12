library announcement;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'announcement.g.dart';

abstract class Announcement
    implements Built<Announcement, AnnouncementBuilder> {
  @nullable
  String get title;

  @nullable
  String get description;

  Announcement._();

  factory Announcement([updates(AnnouncementBuilder b)]) = _$Announcement;

  String toJson() {
    return json
        .encode(serializers.serializeWith(Announcement.serializer, this));
  }

  static Announcement fromJson(String jsonString) {
    return serializers.deserializeWith(
        Announcement.serializer, json.decode(jsonString));
  }

  static Announcement fromMap(Map map) {
    return serializers.deserializeWith(Announcement.serializer, map);
  }

  static Serializer<Announcement> get serializer => _$announcementSerializer;
}
