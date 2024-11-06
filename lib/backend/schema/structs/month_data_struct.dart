// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MonthDataStruct extends FFFirebaseStruct {
  MonthDataStruct({
    String? val,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _val = val,
        _name = name,
        super(firestoreUtilData);

  // "val" field.
  String? _val;
  String get val => _val ?? '';
  set val(String? val) => _val = val;

  bool hasVal() => _val != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static MonthDataStruct fromMap(Map<String, dynamic> data) => MonthDataStruct(
        val: data['val'] as String?,
        name: data['name'] as String?,
      );

  static MonthDataStruct? maybeFromMap(dynamic data) => data is Map
      ? MonthDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'val': _val,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'val': serializeParam(
          _val,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static MonthDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MonthDataStruct(
        val: deserializeParam(
          data['val'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MonthDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MonthDataStruct && val == other.val && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([val, name]);
}

MonthDataStruct createMonthDataStruct({
  String? val,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MonthDataStruct(
      val: val,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MonthDataStruct? updateMonthDataStruct(
  MonthDataStruct? monthData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    monthData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMonthDataStructData(
  Map<String, dynamic> firestoreData,
  MonthDataStruct? monthData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (monthData == null) {
    return;
  }
  if (monthData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && monthData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final monthDataData = getMonthDataFirestoreData(monthData, forFieldValue);
  final nestedData = monthDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = monthData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMonthDataFirestoreData(
  MonthDataStruct? monthData, [
  bool forFieldValue = false,
]) {
  if (monthData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(monthData.toMap());

  // Add any Firestore field values
  monthData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMonthDataListFirestoreData(
  List<MonthDataStruct>? monthDatas,
) =>
    monthDatas?.map((e) => getMonthDataFirestoreData(e, true)).toList() ?? [];
