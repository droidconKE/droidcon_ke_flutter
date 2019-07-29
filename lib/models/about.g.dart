// GENERATED CODE - DO NOT MODIFY BY HAND

part of about;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<About> _$aboutSerializer = new _$AboutSerializer();

class _$AboutSerializer implements StructuredSerializer<About> {
  @override
  final Iterable<Type> types = const [About, _$About];
  @override
  final String wireName = 'About';

  @override
  Iterable<Object> serialize(Serializers serializers, About object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.documentID != null) {
      result
        ..add('documentID')
        ..add(serializers.serialize(object.documentID,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.bio != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(object.bio,
            specifiedType: const FullType(String)));
    }
    if (object.logoUrl != null) {
      result
        ..add('logoUrl')
        ..add(serializers.serialize(object.logoUrl,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  About deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AboutBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'documentID':
          result.documentID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'logoUrl':
          result.logoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$About extends About {
  @override
  final String documentID;
  @override
  final int id;
  @override
  final String name;
  @override
  final String bio;
  @override
  final String logoUrl;

  factory _$About([void Function(AboutBuilder) updates]) =>
      (new AboutBuilder()..update(updates)).build();

  _$About._({this.documentID, this.id, this.name, this.bio, this.logoUrl})
      : super._();

  @override
  About rebuild(void Function(AboutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AboutBuilder toBuilder() => new AboutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is About &&
        documentID == other.documentID &&
        id == other.id &&
        name == other.name &&
        bio == other.bio &&
        logoUrl == other.logoUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, documentID.hashCode), id.hashCode), name.hashCode),
            bio.hashCode),
        logoUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('About')
          ..add('documentID', documentID)
          ..add('id', id)
          ..add('name', name)
          ..add('bio', bio)
          ..add('logoUrl', logoUrl))
        .toString();
  }
}

class AboutBuilder implements Builder<About, AboutBuilder> {
  _$About _$v;

  String _documentID;

  String get documentID => _$this._documentID;

  set documentID(String documentID) => _$this._documentID = documentID;

  int _id;

  int get id => _$this._id;

  set id(int id) => _$this._id = id;

  String _name;

  String get name => _$this._name;

  set name(String name) => _$this._name = name;

  String _bio;

  String get bio => _$this._bio;

  set bio(String bio) => _$this._bio = bio;

  String _logoUrl;

  String get logoUrl => _$this._logoUrl;

  set logoUrl(String logoUrl) => _$this._logoUrl = logoUrl;

  AboutBuilder();

  AboutBuilder get _$this {
    if (_$v != null) {
      _documentID = _$v.documentID;
      _id = _$v.id;
      _name = _$v.name;
      _bio = _$v.bio;
      _logoUrl = _$v.logoUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(About other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$About;
  }

  @override
  void update(void Function(AboutBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$About build() {
    final _$result = _$v ??
        new _$About._(
            documentID: documentID,
            id: id,
            name: name,
            bio: bio,
            logoUrl: logoUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
