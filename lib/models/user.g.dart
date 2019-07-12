// GENERATED CODE - DO NOT MODIFY BY HAND

part of user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];
    if (object.photoUrl != null) {
      result
        ..add('photoUrl')
        ..add(serializers.serialize(object.photoUrl,
            specifiedType: const FullType(String)));
    }
    if (object.refresh_token != null) {
      result
        ..add('refresh_token')
        ..add(serializers.serialize(object.refresh_token,
            specifiedType: const FullType(String)));
    }
    if (object.user_id != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(object.user_id,
            specifiedType: const FullType(String)));
    }
    if (object.user_name != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(object.user_name,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'refresh_token':
          result.refresh_token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_name':
          result.user_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String email;
  @override
  final String photoUrl;
  @override
  final String refresh_token;
  @override
  final String user_id;
  @override
  final String user_name;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.email,
      this.photoUrl,
      this.refresh_token,
      this.user_id,
      this.user_name})
      : super._() {
    if (email == null) {
      throw new BuiltValueNullFieldError('User', 'email');
    }
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        email == other.email &&
        photoUrl == other.photoUrl &&
        refresh_token == other.refresh_token &&
        user_id == other.user_id &&
        user_name == other.user_name;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, email.hashCode), photoUrl.hashCode),
                refresh_token.hashCode),
            user_id.hashCode),
        user_name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('email', email)
          ..add('photoUrl', photoUrl)
          ..add('refresh_token', refresh_token)
          ..add('user_id', user_id)
          ..add('user_name', user_name))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _email;

  String get email => _$this._email;

  set email(String email) => _$this._email = email;

  String _photoUrl;

  String get photoUrl => _$this._photoUrl;

  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _refresh_token;

  String get refresh_token => _$this._refresh_token;

  set refresh_token(String refresh_token) =>
      _$this._refresh_token = refresh_token;

  String _user_id;

  String get user_id => _$this._user_id;

  set user_id(String user_id) => _$this._user_id = user_id;

  String _user_name;

  String get user_name => _$this._user_name;

  set user_name(String user_name) => _$this._user_name = user_name;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _photoUrl = _$v.photoUrl;
      _refresh_token = _$v.refresh_token;
      _user_id = _$v.user_id;
      _user_name = _$v.user_name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            email: email,
            photoUrl: photoUrl,
            refresh_token: refresh_token,
            user_id: user_id,
            user_name: user_name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
