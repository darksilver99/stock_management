// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppSuggestDataStruct extends FFFirebaseStruct {
  AppSuggestDataStruct({
    String? appName,
    String? appImage,
    String? appUrl,
    String? appDetail,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _appName = appName,
        _appImage = appImage,
        _appUrl = appUrl,
        _appDetail = appDetail,
        super(firestoreUtilData);

  // "app_name" field.
  String? _appName;
  String get appName => _appName ?? '';
  set appName(String? val) => _appName = val;

  bool hasAppName() => _appName != null;

  // "app_image" field.
  String? _appImage;
  String get appImage => _appImage ?? '';
  set appImage(String? val) => _appImage = val;

  bool hasAppImage() => _appImage != null;

  // "app_url" field.
  String? _appUrl;
  String get appUrl => _appUrl ?? '';
  set appUrl(String? val) => _appUrl = val;

  bool hasAppUrl() => _appUrl != null;

  // "app_detail" field.
  String? _appDetail;
  String get appDetail => _appDetail ?? '';
  set appDetail(String? val) => _appDetail = val;

  bool hasAppDetail() => _appDetail != null;

  static AppSuggestDataStruct fromMap(Map<String, dynamic> data) =>
      AppSuggestDataStruct(
        appName: data['app_name'] as String?,
        appImage: data['app_image'] as String?,
        appUrl: data['app_url'] as String?,
        appDetail: data['app_detail'] as String?,
      );

  static AppSuggestDataStruct? maybeFromMap(dynamic data) => data is Map
      ? AppSuggestDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'app_name': _appName,
        'app_image': _appImage,
        'app_url': _appUrl,
        'app_detail': _appDetail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'app_name': serializeParam(
          _appName,
          ParamType.String,
        ),
        'app_image': serializeParam(
          _appImage,
          ParamType.String,
        ),
        'app_url': serializeParam(
          _appUrl,
          ParamType.String,
        ),
        'app_detail': serializeParam(
          _appDetail,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppSuggestDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppSuggestDataStruct(
        appName: deserializeParam(
          data['app_name'],
          ParamType.String,
          false,
        ),
        appImage: deserializeParam(
          data['app_image'],
          ParamType.String,
          false,
        ),
        appUrl: deserializeParam(
          data['app_url'],
          ParamType.String,
          false,
        ),
        appDetail: deserializeParam(
          data['app_detail'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AppSuggestDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppSuggestDataStruct &&
        appName == other.appName &&
        appImage == other.appImage &&
        appUrl == other.appUrl &&
        appDetail == other.appDetail;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([appName, appImage, appUrl, appDetail]);
}

AppSuggestDataStruct createAppSuggestDataStruct({
  String? appName,
  String? appImage,
  String? appUrl,
  String? appDetail,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppSuggestDataStruct(
      appName: appName,
      appImage: appImage,
      appUrl: appUrl,
      appDetail: appDetail,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppSuggestDataStruct? updateAppSuggestDataStruct(
  AppSuggestDataStruct? appSuggestData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appSuggestData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppSuggestDataStructData(
  Map<String, dynamic> firestoreData,
  AppSuggestDataStruct? appSuggestData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appSuggestData == null) {
    return;
  }
  if (appSuggestData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && appSuggestData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appSuggestDataData =
      getAppSuggestDataFirestoreData(appSuggestData, forFieldValue);
  final nestedData =
      appSuggestDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = appSuggestData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppSuggestDataFirestoreData(
  AppSuggestDataStruct? appSuggestData, [
  bool forFieldValue = false,
]) {
  if (appSuggestData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appSuggestData.toMap());

  // Add any Firestore field values
  appSuggestData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppSuggestDataListFirestoreData(
  List<AppSuggestDataStruct>? appSuggestDatas,
) =>
    appSuggestDatas
        ?.map((e) => getAppSuggestDataFirestoreData(e, true))
        .toList() ??
    [];
