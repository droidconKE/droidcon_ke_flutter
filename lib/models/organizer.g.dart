// GENERATED CODE - DO NOT MODIFY BY HAND

part of organizer;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Organizer> _$organizerSerializer = new _$OrganizerSerializer();

class _$OrganizerSerializer implements StructuredSerializer<Organizer> {
  @override
  final Iterable<Type> types = const [Organizer, _$Organizer];
  @override
  final String wireName = 'Organizer';

  @override
  Iterable<Object> serialize(Serializers serializers, Organizer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.bio != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(object.bio,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.logoUrl != null) {
      result
        ..add('logoUrl')
        ..add(serializers.serialize(object.logoUrl,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.site != null) {
      result
        ..add('site')
        ..add(serializers.serialize(object.site,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Organizer deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrganizerBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'logoUrl':
          result.logoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'site':
          result.site = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Organizer extends Organizer {
  @override
  final String bio;
  @override
  final int id;
  @override
  final String logoUrl;
  @override
  final String name;
  @override
  final String site;

  factory _$Organizer([void Function(OrganizerBuilder) updates]) =>
      (new OrganizerBuilder()..update(updates)).build();

  _$Organizer._({this.bio, this.id, this.logoUrl, this.name, this.site})
      : super._();

  @override
  Organizer rebuild(void Function(OrganizerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizerBuilder toBuilder() => new OrganizerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Organizer &&
        bio == other.bio &&
        id == other.id &&
        logoUrl == other.logoUrl &&
        name == other.name &&
        site == other.site;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, bio.hashCode), id.hashCode), logoUrl.hashCode),
            name.hashCode),
        site.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Organizer')
          ..add('bio', bio)
          ..add('id', id)
          ..add('logoUrl', logoUrl)
          ..add('name', name)
          ..add('site', site))
        .toString();
  }
}

class OrganizerBuilder implements Builder<Organizer, OrganizerBuilder> {
  _$Organizer _$v;

  String _bio;

  String get bio => _$this._bio;

  set bio(String bio) => _$this._bio = bio;

  int _id;

  int get id => _$this._id;

  set id(int id) => _$this._id = id;

  String _logoUrl;

  String get logoUrl => _$this._logoUrl;

  set logoUrl(String logoUrl) => _$this._logoUrl = logoUrl;

  String _name;

  String get name => _$this._name;

  set name(String name) => _$this._name = name;

  String _site;

  String get site => _$this._site;

  set site(String site) => _$this._site = site;

  OrganizerBuilder();

  OrganizerBuilder get _$this {
    if (_$v != null) {
      _bio = _$v.bio;
      _id = _$v.id;
      _logoUrl = _$v.logoUrl;
      _name = _$v.name;
      _site = _$v.site;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Organizer other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Organizer;
  }

  @override
  void update(void Function(OrganizerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Organizer build() {
    final _$result = _$v ??
        new _$Organizer._(
            bio: bio, id: id, logoUrl: logoUrl, name: name, site: site);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
