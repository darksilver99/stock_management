// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigDataStruct extends FFFirebaseStruct {
  ConfigDataStruct({
    int? storeVersion,
    String? storeIosLink,
    String? storeAndroidLink,
    String? policyUrl,
    int? freeDay,
    List<String>? paymentAlertText,
    String? paymentDetailImage,
    String? promotionDetailImage,
    List<String>? contact,
    bool? isReview,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _storeVersion = storeVersion,
        _storeIosLink = storeIosLink,
        _storeAndroidLink = storeAndroidLink,
        _policyUrl = policyUrl,
        _freeDay = freeDay,
        _paymentAlertText = paymentAlertText,
        _paymentDetailImage = paymentDetailImage,
        _promotionDetailImage = promotionDetailImage,
        _contact = contact,
        _isReview = isReview,
        super(firestoreUtilData);

  // "store_version" field.
  int? _storeVersion;
  int get storeVersion => _storeVersion ?? 0;
  set storeVersion(int? val) => _storeVersion = val;

  void incrementStoreVersion(int amount) =>
      storeVersion = storeVersion + amount;

  bool hasStoreVersion() => _storeVersion != null;

  // "store_ios_link" field.
  String? _storeIosLink;
  String get storeIosLink => _storeIosLink ?? '';
  set storeIosLink(String? val) => _storeIosLink = val;

  bool hasStoreIosLink() => _storeIosLink != null;

  // "store_android_link" field.
  String? _storeAndroidLink;
  String get storeAndroidLink => _storeAndroidLink ?? '';
  set storeAndroidLink(String? val) => _storeAndroidLink = val;

  bool hasStoreAndroidLink() => _storeAndroidLink != null;

  // "policy_url" field.
  String? _policyUrl;
  String get policyUrl => _policyUrl ?? '';
  set policyUrl(String? val) => _policyUrl = val;

  bool hasPolicyUrl() => _policyUrl != null;

  // "free_day" field.
  int? _freeDay;
  int get freeDay => _freeDay ?? 0;
  set freeDay(int? val) => _freeDay = val;

  void incrementFreeDay(int amount) => freeDay = freeDay + amount;

  bool hasFreeDay() => _freeDay != null;

  // "payment_alert_text" field.
  List<String>? _paymentAlertText;
  List<String> get paymentAlertText => _paymentAlertText ?? const [];
  set paymentAlertText(List<String>? val) => _paymentAlertText = val;

  void updatePaymentAlertText(Function(List<String>) updateFn) {
    updateFn(_paymentAlertText ??= []);
  }

  bool hasPaymentAlertText() => _paymentAlertText != null;

  // "payment_detail_image" field.
  String? _paymentDetailImage;
  String get paymentDetailImage => _paymentDetailImage ?? '';
  set paymentDetailImage(String? val) => _paymentDetailImage = val;

  bool hasPaymentDetailImage() => _paymentDetailImage != null;

  // "promotion_detail_image" field.
  String? _promotionDetailImage;
  String get promotionDetailImage => _promotionDetailImage ?? '';
  set promotionDetailImage(String? val) => _promotionDetailImage = val;

  bool hasPromotionDetailImage() => _promotionDetailImage != null;

  // "contact" field.
  List<String>? _contact;
  List<String> get contact => _contact ?? const [];
  set contact(List<String>? val) => _contact = val;

  void updateContact(Function(List<String>) updateFn) {
    updateFn(_contact ??= []);
  }

  bool hasContact() => _contact != null;

  // "isReview" field.
  bool? _isReview;
  bool get isReview => _isReview ?? false;
  set isReview(bool? val) => _isReview = val;

  bool hasIsReview() => _isReview != null;

  static ConfigDataStruct fromMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        storeVersion: castToType<int>(data['store_version']),
        storeIosLink: data['store_ios_link'] as String?,
        storeAndroidLink: data['store_android_link'] as String?,
        policyUrl: data['policy_url'] as String?,
        freeDay: castToType<int>(data['free_day']),
        paymentAlertText: getDataList(data['payment_alert_text']),
        paymentDetailImage: data['payment_detail_image'] as String?,
        promotionDetailImage: data['promotion_detail_image'] as String?,
        contact: getDataList(data['contact']),
        isReview: data['isReview'] as bool?,
      );

  static ConfigDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'store_version': _storeVersion,
        'store_ios_link': _storeIosLink,
        'store_android_link': _storeAndroidLink,
        'policy_url': _policyUrl,
        'free_day': _freeDay,
        'payment_alert_text': _paymentAlertText,
        'payment_detail_image': _paymentDetailImage,
        'promotion_detail_image': _promotionDetailImage,
        'contact': _contact,
        'isReview': _isReview,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'store_version': serializeParam(
          _storeVersion,
          ParamType.int,
        ),
        'store_ios_link': serializeParam(
          _storeIosLink,
          ParamType.String,
        ),
        'store_android_link': serializeParam(
          _storeAndroidLink,
          ParamType.String,
        ),
        'policy_url': serializeParam(
          _policyUrl,
          ParamType.String,
        ),
        'free_day': serializeParam(
          _freeDay,
          ParamType.int,
        ),
        'payment_alert_text': serializeParam(
          _paymentAlertText,
          ParamType.String,
          isList: true,
        ),
        'payment_detail_image': serializeParam(
          _paymentDetailImage,
          ParamType.String,
        ),
        'promotion_detail_image': serializeParam(
          _promotionDetailImage,
          ParamType.String,
        ),
        'contact': serializeParam(
          _contact,
          ParamType.String,
          isList: true,
        ),
        'isReview': serializeParam(
          _isReview,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ConfigDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        storeVersion: deserializeParam(
          data['store_version'],
          ParamType.int,
          false,
        ),
        storeIosLink: deserializeParam(
          data['store_ios_link'],
          ParamType.String,
          false,
        ),
        storeAndroidLink: deserializeParam(
          data['store_android_link'],
          ParamType.String,
          false,
        ),
        policyUrl: deserializeParam(
          data['policy_url'],
          ParamType.String,
          false,
        ),
        freeDay: deserializeParam(
          data['free_day'],
          ParamType.int,
          false,
        ),
        paymentAlertText: deserializeParam<String>(
          data['payment_alert_text'],
          ParamType.String,
          true,
        ),
        paymentDetailImage: deserializeParam(
          data['payment_detail_image'],
          ParamType.String,
          false,
        ),
        promotionDetailImage: deserializeParam(
          data['promotion_detail_image'],
          ParamType.String,
          false,
        ),
        contact: deserializeParam<String>(
          data['contact'],
          ParamType.String,
          true,
        ),
        isReview: deserializeParam(
          data['isReview'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ConfigDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConfigDataStruct &&
        storeVersion == other.storeVersion &&
        storeIosLink == other.storeIosLink &&
        storeAndroidLink == other.storeAndroidLink &&
        policyUrl == other.policyUrl &&
        freeDay == other.freeDay &&
        listEquality.equals(paymentAlertText, other.paymentAlertText) &&
        paymentDetailImage == other.paymentDetailImage &&
        promotionDetailImage == other.promotionDetailImage &&
        listEquality.equals(contact, other.contact) &&
        isReview == other.isReview;
  }

  @override
  int get hashCode => const ListEquality().hash([
        storeVersion,
        storeIosLink,
        storeAndroidLink,
        policyUrl,
        freeDay,
        paymentAlertText,
        paymentDetailImage,
        promotionDetailImage,
        contact,
        isReview
      ]);
}

ConfigDataStruct createConfigDataStruct({
  int? storeVersion,
  String? storeIosLink,
  String? storeAndroidLink,
  String? policyUrl,
  int? freeDay,
  String? paymentDetailImage,
  String? promotionDetailImage,
  bool? isReview,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfigDataStruct(
      storeVersion: storeVersion,
      storeIosLink: storeIosLink,
      storeAndroidLink: storeAndroidLink,
      policyUrl: policyUrl,
      freeDay: freeDay,
      paymentDetailImage: paymentDetailImage,
      promotionDetailImage: promotionDetailImage,
      isReview: isReview,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfigDataStruct? updateConfigDataStruct(
  ConfigDataStruct? configData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    configData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfigDataStructData(
  Map<String, dynamic> firestoreData,
  ConfigDataStruct? configData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (configData == null) {
    return;
  }
  if (configData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && configData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final configDataData = getConfigDataFirestoreData(configData, forFieldValue);
  final nestedData = configDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = configData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfigDataFirestoreData(
  ConfigDataStruct? configData, [
  bool forFieldValue = false,
]) {
  if (configData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(configData.toMap());

  // Add any Firestore field values
  configData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfigDataListFirestoreData(
  List<ConfigDataStruct>? configDatas,
) =>
    configDatas?.map((e) => getConfigDataFirestoreData(e, true)).toList() ?? [];
