// GENERATED CODE - DO NOT MODIFY BY HAND

part of session;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Session> _$sessionSerializer = new _$SessionSerializer();

class _$SessionSerializer implements StructuredSerializer<Session> {
  @override
  final Iterable<Type> types = const [Session, _$Session];
  @override
  final String wireName = 'Session';

  @override
  Iterable<Object> serialize(Serializers serializers, Session object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.am_pm_label != null) {
      result
        ..add('am_pm_label')
        ..add(serializers.serialize(object.am_pm_label,
            specifiedType: const FullType(String)));
    }
    if (object.day_number != null) {
      result
        ..add('day_number')
        ..add(serializers.serialize(object.day_number,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.duration != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(object.duration,
            specifiedType: const FullType(String)));
    }
    if (object.notification_slug != null) {
      result
        ..add('notification_slug')
        ..add(serializers.serialize(object.notification_slug,
            specifiedType: const FullType(String)));
    }
    if (object.photoUrl != null) {
      result
        ..add('photoUrl')
        ..add(serializers.serialize(object.photoUrl,
            specifiedType: const FullType(String)));
    }
    if (object.room != null) {
      result
        ..add('room')
        ..add(serializers.serialize(object.room,
            specifiedType: const FullType(String)));
    }
    if (object.room_id != null) {
      result
        ..add('room_id')
        ..add(serializers.serialize(object.room_id,
            specifiedType: const FullType(int)));
    }
    if (object.session_audience != null) {
      result
        ..add('session_audience')
        ..add(serializers.serialize(object.session_audience,
            specifiedType: const FullType(String)));
    }
    if (object.session_color != null) {
      result
        ..add('session_color')
        ..add(serializers.serialize(object.session_color,
            specifiedType: const FullType(String)));
    }
    if (object.speaker_id != null) {
      result
        ..add('speaker_id')
        ..add(serializers.serialize(object.speaker_id,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.time != null) {
      result
        ..add('time')
        ..add(serializers.serialize(object.time,
            specifiedType: const FullType(String)));
    }
    if (object.time_in_am != null) {
      result
        ..add('time_in_am')
        ..add(serializers.serialize(object.time_in_am,
            specifiedType: const FullType(String)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.topic != null) {
      result
        ..add('topic')
        ..add(serializers.serialize(object.topic,
            specifiedType: const FullType(String)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Session deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SessionBuilder();

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
        case 'am_pm_label':
          result.am_pm_label = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'day_number':
          result.day_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'notification_slug':
          result.notification_slug = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'room':
          result.room = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'room_id':
          result.room_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'session_audience':
          result.session_audience = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'session_color':
          result.session_color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'speaker_id':
          result.speaker_id.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time_in_am':
          result.time_in_am = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'topic':
          result.topic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Session extends Session {
  @override
  final int id;
  @override
  final String am_pm_label;
  @override
  final String day_number;
  @override
  final String description;
  @override
  final String duration;
  @override
  final String notification_slug;
  @override
  final String photoUrl;
  @override
  final String room;
  @override
  final int room_id;
  @override
  final String session_audience;
  @override
  final String session_color;
  @override
  final BuiltList<int> speaker_id;
  @override
  final String time;
  @override
  final String time_in_am;
  @override
  final String title;
  @override
  final String topic;
  @override
  final String type;
  @override
  final String url;

  factory _$Session([void Function(SessionBuilder) updates]) =>
      (new SessionBuilder()..update(updates)).build();

  _$Session._(
      {this.id,
      this.am_pm_label,
      this.day_number,
      this.description,
      this.duration,
      this.notification_slug,
      this.photoUrl,
      this.room,
      this.room_id,
      this.session_audience,
      this.session_color,
      this.speaker_id,
      this.time,
      this.time_in_am,
      this.title,
      this.topic,
      this.type,
      this.url})
      : super._();

  @override
  Session rebuild(void Function(SessionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionBuilder toBuilder() => new SessionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Session &&
        id == other.id &&
        am_pm_label == other.am_pm_label &&
        day_number == other.day_number &&
        description == other.description &&
        duration == other.duration &&
        notification_slug == other.notification_slug &&
        photoUrl == other.photoUrl &&
        room == other.room &&
        room_id == other.room_id &&
        session_audience == other.session_audience &&
        session_color == other.session_color &&
        speaker_id == other.speaker_id &&
        time == other.time &&
        time_in_am == other.time_in_am &&
        title == other.title &&
        topic == other.topic &&
        type == other.type &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            id
                                                                                .hashCode),
                                                                        am_pm_label
                                                                            .hashCode),
                                                                    day_number
                                                                        .hashCode),
                                                                description
                                                                    .hashCode),
                                                            duration.hashCode),
                                                        notification_slug
                                                            .hashCode),
                                                    photoUrl.hashCode),
                                                room.hashCode),
                                            room_id.hashCode),
                                        session_audience.hashCode),
                                    session_color.hashCode),
                                speaker_id.hashCode),
                            time.hashCode),
                        time_in_am.hashCode),
                    title.hashCode),
                topic.hashCode),
            type.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Session')
          ..add('id', id)
          ..add('am_pm_label', am_pm_label)
          ..add('day_number', day_number)
          ..add('description', description)
          ..add('duration', duration)
          ..add('notification_slug', notification_slug)
          ..add('photoUrl', photoUrl)
          ..add('room', room)
          ..add('room_id', room_id)
          ..add('session_audience', session_audience)
          ..add('session_color', session_color)
          ..add('speaker_id', speaker_id)
          ..add('time', time)
          ..add('time_in_am', time_in_am)
          ..add('title', title)
          ..add('topic', topic)
          ..add('type', type)
          ..add('url', url))
        .toString();
  }
}

class SessionBuilder implements Builder<Session, SessionBuilder> {
  _$Session _$v;

  int _id;

  int get id => _$this._id;

  set id(int id) => _$this._id = id;

  String _am_pm_label;

  String get am_pm_label => _$this._am_pm_label;

  set am_pm_label(String am_pm_label) => _$this._am_pm_label = am_pm_label;

  String _day_number;

  String get day_number => _$this._day_number;

  set day_number(String day_number) => _$this._day_number = day_number;

  String _description;

  String get description => _$this._description;

  set description(String description) => _$this._description = description;

  String _duration;

  String get duration => _$this._duration;

  set duration(String duration) => _$this._duration = duration;

  String _notification_slug;

  String get notification_slug => _$this._notification_slug;

  set notification_slug(String notification_slug) =>
      _$this._notification_slug = notification_slug;

  String _photoUrl;

  String get photoUrl => _$this._photoUrl;

  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _room;

  String get room => _$this._room;

  set room(String room) => _$this._room = room;

  int _room_id;

  int get room_id => _$this._room_id;

  set room_id(int room_id) => _$this._room_id = room_id;

  String _session_audience;

  String get session_audience => _$this._session_audience;

  set session_audience(String session_audience) =>
      _$this._session_audience = session_audience;

  String _session_color;

  String get session_color => _$this._session_color;

  set session_color(String session_color) =>
      _$this._session_color = session_color;

  ListBuilder<int> _speaker_id;

  ListBuilder<int> get speaker_id =>
      _$this._speaker_id ??= new ListBuilder<int>();

  set speaker_id(ListBuilder<int> speaker_id) =>
      _$this._speaker_id = speaker_id;

  String _time;

  String get time => _$this._time;

  set time(String time) => _$this._time = time;

  String _time_in_am;

  String get time_in_am => _$this._time_in_am;

  set time_in_am(String time_in_am) => _$this._time_in_am = time_in_am;

  String _title;

  String get title => _$this._title;

  set title(String title) => _$this._title = title;

  String _topic;

  String get topic => _$this._topic;

  set topic(String topic) => _$this._topic = topic;

  String _type;

  String get type => _$this._type;

  set type(String type) => _$this._type = type;

  String _url;

  String get url => _$this._url;

  set url(String url) => _$this._url = url;

  SessionBuilder();

  SessionBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _am_pm_label = _$v.am_pm_label;
      _day_number = _$v.day_number;
      _description = _$v.description;
      _duration = _$v.duration;
      _notification_slug = _$v.notification_slug;
      _photoUrl = _$v.photoUrl;
      _room = _$v.room;
      _room_id = _$v.room_id;
      _session_audience = _$v.session_audience;
      _session_color = _$v.session_color;
      _speaker_id = _$v.speaker_id?.toBuilder();
      _time = _$v.time;
      _time_in_am = _$v.time_in_am;
      _title = _$v.title;
      _topic = _$v.topic;
      _type = _$v.type;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Session other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Session;
  }

  @override
  void update(void Function(SessionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Session build() {
    _$Session _$result;
    try {
      _$result = _$v ??
          new _$Session._(
              id: id,
              am_pm_label: am_pm_label,
              day_number: day_number,
              description: description,
              duration: duration,
              notification_slug: notification_slug,
              photoUrl: photoUrl,
              room: room,
              room_id: room_id,
              session_audience: session_audience,
              session_color: session_color,
              speaker_id: _speaker_id?.build(),
              time: time,
              time_in_am: time_in_am,
              title: title,
              topic: topic,
              type: type,
              url: url);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'speaker_id';
        _speaker_id?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Session', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
