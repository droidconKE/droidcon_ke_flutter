library sponsor;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'sponsor.g.dart';

abstract class Sponsor implements Built<Sponsor, SponsorBuilder> {
  @nullable
  String get bio;

  @nullable
  int get id;

  @nullable
  String get logoUrl;

  @nullable
  String get name;

  Sponsor._();

  factory Sponsor([updates(SponsorBuilder b)]) = _$Sponsor;

  String toJson() {
    return json.encode(serializers.serializeWith(Sponsor.serializer, this));
  }

  static Sponsor fromJson(String jsonString) {
    return serializers.deserializeWith(
        Sponsor.serializer, json.decode(jsonString));
  }

  static Sponsor fromMap(Map map) {
    return serializers.deserializeWith(Sponsor.serializer, map);
  }

  static Serializer<Sponsor> get serializer => _$sponsorSerializer;
}
