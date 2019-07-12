library organizer;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'organizer.g.dart';

abstract class Organizer implements Built<Organizer, OrganizerBuilder> {
  @nullable
  String get bio;

  @nullable
  int get id;

  @nullable
  String get logoUrl;

  @nullable
  String get name;

  @nullable
  String get site;

  Organizer._();

  factory Organizer([updates(OrganizerBuilder b)]) = _$Organizer;

  String toJson() {
    return json.encode(serializers.serializeWith(Organizer.serializer, this));
  }

  static Organizer fromJson(String jsonString) {
    return serializers.deserializeWith(
        Organizer.serializer, json.decode(jsonString));
  }

  static Organizer fromMap(Map map) {
    return serializers.deserializeWith(Organizer.serializer, map);
  }

  static Serializer<Organizer> get serializer => _$organizerSerializer;
}
