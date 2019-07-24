// GENERATED CODE - DO NOT MODIFY BY HAND

part of starred_session;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StarredSession> _$starredSessionSerializer =
    new _$StarredSessionSerializer();

class _$StarredSessionSerializer
    implements StructuredSerializer<StarredSession> {
  @override
  final Iterable<Type> types = const [StarredSession, _$StarredSession];
  @override
  final String wireName = 'StarredSession';

  @override
  Iterable<Object> serialize(Serializers serializers, StarredSession object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.day != null) {
      result
        ..add('day')
        ..add(serializers.serialize(object.day,
            specifiedType: const FullType(String)));
    }
    if (object.documentId != null) {
      result
        ..add('documentId')
        ..add(serializers.serialize(object.documentId,
            specifiedType: const FullType(String)));
    }
    if (object.session_id != null) {
      result
        ..add('session_id')
        ..add(serializers.serialize(object.session_id,
            specifiedType: const FullType(int)));
    }
    if (object.starred != null) {
      result
        ..add('starred')
        ..add(serializers.serialize(object.starred,
            specifiedType: const FullType(bool)));
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
  StarredSession deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StarredSessionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'documentId':
          result.documentId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'session_id':
          result.session_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'starred':
          result.starred = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$StarredSession extends StarredSession {
  @override
  final String day;
  @override
  final String documentId;
  @override
  final int session_id;
  @override
  final bool starred;
  @override
  final String user_id;

  factory _$StarredSession([void Function(StarredSessionBuilder) updates]) =>
      (new StarredSessionBuilder()..update(updates)).build();

  _$StarredSession._(
      {this.day, this.documentId, this.session_id, this.starred, this.user_id})
      : super._();

  @override
  StarredSession rebuild(void Function(StarredSessionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StarredSessionBuilder toBuilder() =>
      new StarredSessionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StarredSession &&
        day == other.day &&
        documentId == other.documentId &&
        session_id == other.session_id &&
        starred == other.starred &&
        user_id == other.user_id;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, day.hashCode), documentId.hashCode),
                session_id.hashCode),
            starred.hashCode),
        user_id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StarredSession')
          ..add('day', day)
          ..add('documentId', documentId)
          ..add('session_id', session_id)
          ..add('starred', starred)
          ..add('user_id', user_id))
        .toString();
  }
}

class StarredSessionBuilder
    implements Builder<StarredSession, StarredSessionBuilder> {
  _$StarredSession _$v;

  String _day;
  String get day => _$this._day;
  set day(String day) => _$this._day = day;

  String _documentId;
  String get documentId => _$this._documentId;
  set documentId(String documentId) => _$this._documentId = documentId;

  int _session_id;
  int get session_id => _$this._session_id;
  set session_id(int session_id) => _$this._session_id = session_id;

  bool _starred;
  bool get starred => _$this._starred;
  set starred(bool starred) => _$this._starred = starred;

  String _user_id;
  String get user_id => _$this._user_id;
  set user_id(String user_id) => _$this._user_id = user_id;

  StarredSessionBuilder();

  StarredSessionBuilder get _$this {
    if (_$v != null) {
      _day = _$v.day;
      _documentId = _$v.documentId;
      _session_id = _$v.session_id;
      _starred = _$v.starred;
      _user_id = _$v.user_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StarredSession other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StarredSession;
  }

  @override
  void update(void Function(StarredSessionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StarredSession build() {
    final _$result = _$v ??
        new _$StarredSession._(
            day: day,
            documentId: documentId,
            session_id: session_id,
            starred: starred,
            user_id: user_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
