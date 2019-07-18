// GENERATED CODE - DO NOT MODIFY BY HAND

part of speaker;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Speaker> _$speakerSerializer = new _$SpeakerSerializer();

class _$SpeakerSerializer implements StructuredSerializer<Speaker> {
  @override
  final Iterable<Type> types = const [Speaker, _$Speaker];
  @override
  final String wireName = 'Speaker';

  @override
  Iterable<Object> serialize(Serializers serializers, Speaker object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.bio != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(object.bio,
            specifiedType: const FullType(String)));
    }
    if (object.company != null) {
      result
        ..add('company')
        ..add(serializers.serialize(object.company,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.photoUrl != null) {
      result
        ..add('photoUrl')
        ..add(serializers.serialize(object.photoUrl,
            specifiedType: const FullType(String)));
    }
    if (object.twitterHandle != null) {
      result
        ..add('twitterHandle')
        ..add(serializers.serialize(object.twitterHandle,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Speaker deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SpeakerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'twitterHandle':
          result.twitterHandle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Speaker extends Speaker {
  @override
  final String bio;
  @override
  final String company;
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final String twitterHandle;
  @override
  final int id;

  factory _$Speaker([void Function(SpeakerBuilder) updates]) =>
      (new SpeakerBuilder()..update(updates)).build();

  _$Speaker._(
      {this.bio,
      this.company,
      this.name,
      this.photoUrl,
      this.twitterHandle,
      this.id})
      : super._();

  @override
  Speaker rebuild(void Function(SpeakerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpeakerBuilder toBuilder() => new SpeakerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Speaker &&
        bio == other.bio &&
        company == other.company &&
        name == other.name &&
        photoUrl == other.photoUrl &&
        twitterHandle == other.twitterHandle &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, bio.hashCode), company.hashCode), name.hashCode),
                photoUrl.hashCode),
            twitterHandle.hashCode),
        id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Speaker')
          ..add('bio', bio)
          ..add('company', company)
          ..add('name', name)
          ..add('photoUrl', photoUrl)
          ..add('twitterHandle', twitterHandle)
          ..add('id', id))
        .toString();
  }
}

class SpeakerBuilder implements Builder<Speaker, SpeakerBuilder> {
  _$Speaker _$v;

  String _bio;
  String get bio => _$this._bio;
  set bio(String bio) => _$this._bio = bio;

  String _company;
  String get company => _$this._company;
  set company(String company) => _$this._company = company;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _twitterHandle;
  String get twitterHandle => _$this._twitterHandle;
  set twitterHandle(String twitterHandle) =>
      _$this._twitterHandle = twitterHandle;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  SpeakerBuilder();

  SpeakerBuilder get _$this {
    if (_$v != null) {
      _bio = _$v.bio;
      _company = _$v.company;
      _name = _$v.name;
      _photoUrl = _$v.photoUrl;
      _twitterHandle = _$v.twitterHandle;
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Speaker other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Speaker;
  }

  @override
  void update(void Function(SpeakerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Speaker build() {
    final _$result = _$v ??
        new _$Speaker._(
            bio: bio,
            company: company,
            name: name,
            photoUrl: photoUrl,
            twitterHandle: twitterHandle,
            id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
