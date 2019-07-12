library room;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'room.g.dart';

abstract class Room implements Built<Room, RoomBuilder> {
  @nullable
  int get id;

  @nullable
  String get name;

  @nullable
  String get description;

  Room._();

  factory Room([updates(RoomBuilder b)]) = _$Room;

  String toJson() {
    return json.encode(serializers.serializeWith(Room.serializer, this));
  }

  static Room fromJson(String jsonString) {
    return serializers.deserializeWith(
        Room.serializer, json.decode(jsonString));
  }

  static Room fromMap(Map map) {
    return serializers.deserializeWith(Room.serializer, map);
  }

  static Serializer<Room> get serializer => _$roomSerializer;
}
