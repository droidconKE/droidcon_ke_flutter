// GENERATED CODE - DO NOT MODIFY BY HAND

part of session_topic;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SessionTopic> _$sessionTopicSerializer =
    new _$SessionTopicSerializer();

class _$SessionTopicSerializer implements StructuredSerializer<SessionTopic> {
  @override
  final Iterable<Type> types = const [SessionTopic, _$SessionTopic];
  @override
  final String wireName = 'SessionTopic';

  @override
  Iterable<Object> serialize(Serializers serializers, SessionTopic object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
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
  SessionTopic deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SessionTopicBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
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

class _$SessionTopic extends SessionTopic {
  @override
  final int id;
  @override
  final String name;

  factory _$SessionTopic([void Function(SessionTopicBuilder) updates]) =>
      (new SessionTopicBuilder()..update(updates)).build();

  _$SessionTopic._({this.id, this.name}) : super._();

  @override
  SessionTopic rebuild(void Function(SessionTopicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionTopicBuilder toBuilder() => new SessionTopicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SessionTopic && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SessionTopic')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class SessionTopicBuilder
    implements Builder<SessionTopic, SessionTopicBuilder> {
  _$SessionTopic _$v;

  int _id;

  int get id => _$this._id;

  set id(int id) => _$this._id = id;

  String _name;

  String get name => _$this._name;

  set name(String name) => _$this._name = name;

  SessionTopicBuilder();

  SessionTopicBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SessionTopic other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SessionTopic;
  }

  @override
  void update(void Function(SessionTopicBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SessionTopic build() {
    final _$result = _$v ?? new _$SessionTopic._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
