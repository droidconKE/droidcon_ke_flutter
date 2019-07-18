// GENERATED CODE - DO NOT MODIFY BY HAND

part of announcement;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Announcement> _$announcementSerializer =
    new _$AnnouncementSerializer();

class _$AnnouncementSerializer implements StructuredSerializer<Announcement> {
  @override
  final Iterable<Type> types = const [Announcement, _$Announcement];
  @override
  final String wireName = 'Announcement';

  @override
  Iterable<Object> serialize(Serializers serializers, Announcement object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Announcement deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AnnouncementBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Announcement extends Announcement {
  @override
  final String title;
  @override
  final String description;

  factory _$Announcement([void Function(AnnouncementBuilder) updates]) =>
      (new AnnouncementBuilder()..update(updates)).build();

  _$Announcement._({this.title, this.description}) : super._();

  @override
  Announcement rebuild(void Function(AnnouncementBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnnouncementBuilder toBuilder() => new AnnouncementBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Announcement &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, title.hashCode), description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Announcement')
          ..add('title', title)
          ..add('description', description))
        .toString();
  }
}

class AnnouncementBuilder
    implements Builder<Announcement, AnnouncementBuilder> {
  _$Announcement _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  AnnouncementBuilder();

  AnnouncementBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Announcement other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Announcement;
  }

  @override
  void update(void Function(AnnouncementBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Announcement build() {
    final _$result =
        _$v ?? new _$Announcement._(title: title, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
