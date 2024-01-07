// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationModelStruct extends BaseStruct {
  NotificationModelStruct({
    String? title,
    String? date,
    String? time,
    bool? isClicked,
  })  : _title = title,
        _date = date,
        _time = time,
        _isClicked = isClicked;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;
  bool hasTime() => _time != null;

  // "isClicked" field.
  bool? _isClicked;
  bool get isClicked => _isClicked ?? false;
  set isClicked(bool? val) => _isClicked = val;
  bool hasIsClicked() => _isClicked != null;

  static NotificationModelStruct fromMap(Map<String, dynamic> data) =>
      NotificationModelStruct(
        title: data['title'] as String?,
        date: data['date'] as String?,
        time: data['time'] as String?,
        isClicked: data['isClicked'] as bool?,
      );

  static NotificationModelStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'date': _date,
        'time': _time,
        'isClicked': _isClicked,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'isClicked': serializeParam(
          _isClicked,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NotificationModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationModelStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        isClicked: deserializeParam(
          data['isClicked'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'NotificationModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationModelStruct &&
        title == other.title &&
        date == other.date &&
        time == other.time &&
        isClicked == other.isClicked;
  }

  @override
  int get hashCode => const ListEquality().hash([title, date, time, isClicked]);
}

NotificationModelStruct createNotificationModelStruct({
  String? title,
  String? date,
  String? time,
  bool? isClicked,
}) =>
    NotificationModelStruct(
      title: title,
      date: date,
      time: time,
      isClicked: isClicked,
    );
