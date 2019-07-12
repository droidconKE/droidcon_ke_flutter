// GENERATED CODE - DO NOT MODIFY BY HAND

part of event_feedback;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventFeedback> _$eventFeedbackSerializer =
    new _$EventFeedbackSerializer();

class _$EventFeedbackSerializer implements StructuredSerializer<EventFeedback> {
  @override
  final Iterable<Type> types = const [EventFeedback, _$EventFeedback];
  @override
  final String wireName = 'EventFeedback';

  @override
  Iterable<Object> serialize(Serializers serializers, EventFeedback object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.eventFeedback != null) {
      result
        ..add('eventFeedback')
        ..add(serializers.serialize(object.eventFeedback,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  EventFeedback deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventFeedbackBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'eventFeedback':
          result.eventFeedback = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EventFeedback extends EventFeedback {
  @override
  final String eventFeedback;

  factory _$EventFeedback([void Function(EventFeedbackBuilder) updates]) =>
      (new EventFeedbackBuilder()..update(updates)).build();

  _$EventFeedback._({this.eventFeedback}) : super._();

  @override
  EventFeedback rebuild(void Function(EventFeedbackBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventFeedbackBuilder toBuilder() => new EventFeedbackBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventFeedback && eventFeedback == other.eventFeedback;
  }

  @override
  int get hashCode {
    return $jf($jc(0, eventFeedback.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EventFeedback')
          ..add('eventFeedback', eventFeedback))
        .toString();
  }
}

class EventFeedbackBuilder
    implements Builder<EventFeedback, EventFeedbackBuilder> {
  _$EventFeedback _$v;

  String _eventFeedback;

  String get eventFeedback => _$this._eventFeedback;

  set eventFeedback(String eventFeedback) =>
      _$this._eventFeedback = eventFeedback;

  EventFeedbackBuilder();

  EventFeedbackBuilder get _$this {
    if (_$v != null) {
      _eventFeedback = _$v.eventFeedback;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventFeedback other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EventFeedback;
  }

  @override
  void update(void Function(EventFeedbackBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EventFeedback build() {
    final _$result = _$v ?? new _$EventFeedback._(eventFeedback: eventFeedback);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
