library user;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  String get email;

  @nullable
  String get photoUrl;

  @nullable
  String get refresh_token;

  @nullable
  String get user_id;

  @nullable
  String get user_name;

  User._();

  factory User([updates(UserBuilder b)]) = _$User;

  String toJson() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  static User fromJson(String jsonString) {
    return serializers.deserializeWith(
        User.serializer, json.decode(jsonString));
  }

  static User fromMap(Map map) {
    return serializers.deserializeWith(User.serializer, map);
  }

  static Serializer<User> get serializer => _$userSerializer;
}
