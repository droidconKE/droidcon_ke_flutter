library agenda;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'agenda.g.dart';

abstract class Agenda implements Built<Agenda, AgendaBuilder> {
  @nullable
  int get id;

  @nullable
  String get background_color;

  @nullable
  String get iconUrl;

  @nullable
  String get time;

  @nullable
  String get title;

  Agenda._();

  factory Agenda([updates(AgendaBuilder b)]) = _$Agenda;

  String toJson() {
    return json.encode(serializers.serializeWith(Agenda.serializer, this));
  }

  static Agenda fromJson(String jsonString) {
    return serializers.deserializeWith(
        Agenda.serializer, json.decode(jsonString));
  }

  static Agenda fromMap(Map map) {
    return serializers.deserializeWith(Agenda.serializer, map);
  }

  static Serializer<Agenda> get serializer => _$agendaSerializer;
}
