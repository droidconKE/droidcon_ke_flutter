import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'index.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  About,
  Agenda,
  Announcement,
  EventFeedback,
  EventType,
  Organizer,
  Room,
  Session,
  SessionFeedback,
  SessionTopic,
  SessionType,
  Speaker,
  Sponsor,
  StarredSession,
  User,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
