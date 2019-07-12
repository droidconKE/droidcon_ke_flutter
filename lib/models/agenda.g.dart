// GENERATED CODE - DO NOT MODIFY BY HAND

part of agenda;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Agenda> _$agendaSerializer = new _$AgendaSerializer();

class _$AgendaSerializer implements StructuredSerializer<Agenda> {
  @override
  final Iterable<Type> types = const [Agenda, _$Agenda];
  @override
  final String wireName = 'Agenda';

  @override
  Iterable<Object> serialize(Serializers serializers, Agenda object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.background_color != null) {
      result
        ..add('background_color')
        ..add(serializers.serialize(object.background_color,
            specifiedType: const FullType(String)));
    }
    if (object.iconUrl != null) {
      result
        ..add('iconUrl')
        ..add(serializers.serialize(object.iconUrl,
            specifiedType: const FullType(String)));
    }
    if (object.time != null) {
      result
        ..add('time')
        ..add(serializers.serialize(object.time,
            specifiedType: const FullType(String)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Agenda deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AgendaBuilder();

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
        case 'background_color':
          result.background_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'iconUrl':
          result.iconUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Agenda extends Agenda {
  @override
  final int id;
  @override
  final String background_color;
  @override
  final String iconUrl;
  @override
  final String time;
  @override
  final String title;

  factory _$Agenda([void Function(AgendaBuilder) updates]) =>
      (new AgendaBuilder()..update(updates)).build();

  _$Agenda._(
      {this.id, this.background_color, this.iconUrl, this.time, this.title})
      : super._();

  @override
  Agenda rebuild(void Function(AgendaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgendaBuilder toBuilder() => new AgendaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Agenda &&
        id == other.id &&
        background_color == other.background_color &&
        iconUrl == other.iconUrl &&
        time == other.time &&
        title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), background_color.hashCode),
                iconUrl.hashCode),
            time.hashCode),
        title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Agenda')
          ..add('id', id)
          ..add('background_color', background_color)
          ..add('iconUrl', iconUrl)
          ..add('time', time)
          ..add('title', title))
        .toString();
  }
}

class AgendaBuilder implements Builder<Agenda, AgendaBuilder> {
  _$Agenda _$v;

  int _id;

  int get id => _$this._id;

  set id(int id) => _$this._id = id;

  String _background_color;

  String get background_color => _$this._background_color;

  set background_color(String background_color) =>
      _$this._background_color = background_color;

  String _iconUrl;

  String get iconUrl => _$this._iconUrl;

  set iconUrl(String iconUrl) => _$this._iconUrl = iconUrl;

  String _time;

  String get time => _$this._time;

  set time(String time) => _$this._time = time;

  String _title;

  String get title => _$this._title;

  set title(String title) => _$this._title = title;

  AgendaBuilder();

  AgendaBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _background_color = _$v.background_color;
      _iconUrl = _$v.iconUrl;
      _time = _$v.time;
      _title = _$v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Agenda other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Agenda;
  }

  @override
  void update(void Function(AgendaBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Agenda build() {
    final _$result = _$v ??
        new _$Agenda._(
            id: id,
            background_color: background_color,
            iconUrl: iconUrl,
            time: time,
            title: title);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
