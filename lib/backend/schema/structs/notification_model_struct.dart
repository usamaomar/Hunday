// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationModelStruct extends FFFirebaseStruct {
  NotificationModelStruct({
    String? title,
    String? date,
    String? time,
    bool? isClicked,
    String? body,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _date = date,
        _time = time,
        _isClicked = isClicked,
        _body = body,
        super(firestoreUtilData);

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

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  set body(String? val) => _body = val;
  bool hasBody() => _body != null;

  static NotificationModelStruct fromMap(Map<String, dynamic> data) =>
      NotificationModelStruct(
        title: data['title'] as String?,
        date: data['date'] as String?,
        time: data['time'] as String?,
        isClicked: data['isClicked'] as bool?,
        body: data['body'] as String?,
      );

  static NotificationModelStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'date': _date,
        'time': _time,
        'isClicked': _isClicked,
        'body': _body,
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
        'body': serializeParam(
          _body,
          ParamType.String,
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
        body: deserializeParam(
          data['body'],
          ParamType.String,
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
        isClicked == other.isClicked &&
        body == other.body;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, date, time, isClicked, body]);
}

NotificationModelStruct createNotificationModelStruct({
  String? title,
  String? date,
  String? time,
  bool? isClicked,
  String? body,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationModelStruct(
      title: title,
      date: date,
      time: time,
      isClicked: isClicked,
      body: body,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationModelStruct? updateNotificationModelStruct(
  NotificationModelStruct? notificationModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notificationModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationModelStructData(
  Map<String, dynamic> firestoreData,
  NotificationModelStruct? notificationModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notificationModel == null) {
    return;
  }
  if (notificationModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notificationModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationModelData =
      getNotificationModelFirestoreData(notificationModel, forFieldValue);
  final nestedData =
      notificationModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notificationModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationModelFirestoreData(
  NotificationModelStruct? notificationModel, [
  bool forFieldValue = false,
]) {
  if (notificationModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notificationModel.toMap());

  // Add any Firestore field values
  notificationModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationModelListFirestoreData(
  List<NotificationModelStruct>? notificationModels,
) =>
    notificationModels
        ?.map((e) => getNotificationModelFirestoreData(e, true))
        .toList() ??
    [];
