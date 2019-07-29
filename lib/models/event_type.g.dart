// GENERATED CODE - DO NOT MODIFY BY HAND

part of event_type;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventType> _$eventTypeSerializer = new _$EventTypeSerializer();

class _$EventTypeSerializer implements StructuredSerializer<EventType> {
  @override
  final Iterable<Type> types = const [EventType, _$EventType];
  @override
  final String wireName = 'EventType';

  @override
  Iterable<Object> serialize(Serializers serializers, EventType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.eventImageUrl != null) {
      result
        ..add('eventImageUrl')
        ..add(serializers.serialize(object.eventImageUrl,
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
    return result;
  }

  @override
  EventType deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'eventImageUrl':
          result.eventImageUrl = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$EventType extends EventType {
  @override
  final String description;
  @override
  final String eventImageUrl;
  @override
  final int id;
  @override
  final String name;

  factory _$EventType([void Function(EventTypeBuilder) updates]) =>
      (new EventTypeBuilder()..update(updates)).build();

  _$EventType._({this.description, this.eventImageUrl, this.id, this.name})
      : super._();

  @override
  EventType rebuild(void Function(EventTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventTypeBuilder toBuilder() => new EventTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventType &&
        description == other.description &&
        eventImageUrl == other.eventImageUrl &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, description.hashCode), eventImageUrl.hashCode),
            id.hashCode),
        name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EventType')
          ..add('description', description)
          ..add('eventImageUrl', eventImageUrl)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class EventTypeBuilder implements Builder<EventType, EventTypeBuilder> {
  _$EventType _$v;

  String _description;

  String get description => _$this._description;

  set description(String description) => _$this._description = description;

  String _eventImageUrl;

  String get eventImageUrl => _$this._eventImageUrl;

  set eventImageUrl(String eventImageUrl) =>
      _$this._eventImageUrl = eventImageUrl;

  int _id;

  int get id => _$this._id;

  set id(int id) => _$this._id = id;

  String _name;

  String get name => _$this._name;

  set name(String name) => _$this._name = name;

  EventTypeBuilder();

  EventTypeBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _eventImageUrl = _$v.eventImageUrl;
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventType other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EventType;
  }

  @override
  void update(void Function(EventTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EventType build() {
    final _$result = _$v ??
        new _$EventType._(
            description: description,
            eventImageUrl: eventImageUrl,
            id: id,
            name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
