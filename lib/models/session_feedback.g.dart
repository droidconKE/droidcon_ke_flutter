// GENERATED CODE - DO NOT MODIFY BY HAND

part of session_feedback;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SessionFeedback> _$sessionFeedbackSerializer =
    new _$SessionFeedbackSerializer();

class _$SessionFeedbackSerializer
    implements StructuredSerializer<SessionFeedback> {
  @override
  final Iterable<Type> types = const [SessionFeedback, _$SessionFeedback];
  @override
  final String wireName = 'SessionFeedback';

  @override
  Iterable<Object> serialize(Serializers serializers, SessionFeedback object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.day_number != null) {
      result
        ..add('day_number')
        ..add(serializers.serialize(object.day_number,
            specifiedType: const FullType(String)));
    }
    if (object.session_feedback != null) {
      result
        ..add('session_feedback')
        ..add(serializers.serialize(object.session_feedback,
            specifiedType: const FullType(String)));
    }
    if (object.session_id != null) {
      result
        ..add('session_id')
        ..add(serializers.serialize(object.session_id,
            specifiedType: const FullType(String)));
    }
    if (object.session_title != null) {
      result
        ..add('session_title')
        ..add(serializers.serialize(object.session_title,
            specifiedType: const FullType(String)));
    }
    if (object.user_id != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(object.user_id,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SessionFeedback deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SessionFeedbackBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'day_number':
          result.day_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'session_feedback':
          result.session_feedback = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'session_id':
          result.session_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'session_title':
          result.session_title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_id':
          result.user_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SessionFeedback extends SessionFeedback {
  @override
  final String day_number;
  @override
  final String session_feedback;
  @override
  final String session_id;
  @override
  final String session_title;
  @override
  final String user_id;

  factory _$SessionFeedback([void Function(SessionFeedbackBuilder) updates]) =>
      (new SessionFeedbackBuilder()..update(updates)).build();

  _$SessionFeedback._(
      {this.day_number,
      this.session_feedback,
      this.session_id,
      this.session_title,
      this.user_id})
      : super._();

  @override
  SessionFeedback rebuild(void Function(SessionFeedbackBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionFeedbackBuilder toBuilder() =>
      new SessionFeedbackBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SessionFeedback &&
        day_number == other.day_number &&
        session_feedback == other.session_feedback &&
        session_id == other.session_id &&
        session_title == other.session_title &&
        user_id == other.user_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, day_number.hashCode), session_feedback.hashCode),
                session_id.hashCode),
            session_title.hashCode),
        user_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SessionFeedback')
          ..add('day_number', day_number)
          ..add('session_feedback', session_feedback)
          ..add('session_id', session_id)
          ..add('session_title', session_title)
          ..add('user_id', user_id))
        .toString();
  }
}

class SessionFeedbackBuilder
    implements Builder<SessionFeedback, SessionFeedbackBuilder> {
  _$SessionFeedback _$v;

  String _day_number;

  String get day_number => _$this._day_number;

  set day_number(String day_number) => _$this._day_number = day_number;

  String _session_feedback;

  String get session_feedback => _$this._session_feedback;

  set session_feedback(String session_feedback) =>
      _$this._session_feedback = session_feedback;

  String _session_id;

  String get session_id => _$this._session_id;

  set session_id(String session_id) => _$this._session_id = session_id;

  String _session_title;

  String get session_title => _$this._session_title;

  set session_title(String session_title) =>
      _$this._session_title = session_title;

  String _user_id;

  String get user_id => _$this._user_id;

  set user_id(String user_id) => _$this._user_id = user_id;

  SessionFeedbackBuilder();

  SessionFeedbackBuilder get _$this {
    if (_$v != null) {
      _day_number = _$v.day_number;
      _session_feedback = _$v.session_feedback;
      _session_id = _$v.session_id;
      _session_title = _$v.session_title;
      _user_id = _$v.user_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SessionFeedback other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SessionFeedback;
  }

  @override
  void update(void Function(SessionFeedbackBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SessionFeedback build() {
    final _$result = _$v ??
        new _$SessionFeedback._(
            day_number: day_number,
            session_feedback: session_feedback,
            session_id: session_id,
            session_title: session_title,
            user_id: user_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
