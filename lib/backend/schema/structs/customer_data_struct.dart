// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerDataStruct extends FFFirebaseStruct {
  CustomerDataStruct({
    String? subject,
    DateTime? expireDate,
    DocumentReference? customerRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subject = subject,
        _expireDate = expireDate,
        _customerRef = customerRef,
        super(firestoreUtilData);

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "expire_date" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  set expireDate(DateTime? val) => _expireDate = val;

  bool hasExpireDate() => _expireDate != null;

  // "customer_ref" field.
  DocumentReference? _customerRef;
  DocumentReference? get customerRef => _customerRef;
  set customerRef(DocumentReference? val) => _customerRef = val;

  bool hasCustomerRef() => _customerRef != null;

  static CustomerDataStruct fromMap(Map<String, dynamic> data) =>
      CustomerDataStruct(
        subject: data['subject'] as String?,
        expireDate: data['expire_date'] as DateTime?,
        customerRef: data['customer_ref'] as DocumentReference?,
      );

  static CustomerDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomerDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subject': _subject,
        'expire_date': _expireDate,
        'customer_ref': _customerRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'expire_date': serializeParam(
          _expireDate,
          ParamType.DateTime,
        ),
        'customer_ref': serializeParam(
          _customerRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CustomerDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomerDataStruct(
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        expireDate: deserializeParam(
          data['expire_date'],
          ParamType.DateTime,
          false,
        ),
        customerRef: deserializeParam(
          data['customer_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['customer_list'],
        ),
      );

  @override
  String toString() => 'CustomerDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomerDataStruct &&
        subject == other.subject &&
        expireDate == other.expireDate &&
        customerRef == other.customerRef;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([subject, expireDate, customerRef]);
}

CustomerDataStruct createCustomerDataStruct({
  String? subject,
  DateTime? expireDate,
  DocumentReference? customerRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustomerDataStruct(
      subject: subject,
      expireDate: expireDate,
      customerRef: customerRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustomerDataStruct? updateCustomerDataStruct(
  CustomerDataStruct? customerData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    customerData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustomerDataStructData(
  Map<String, dynamic> firestoreData,
  CustomerDataStruct? customerData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (customerData == null) {
    return;
  }
  if (customerData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && customerData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final customerDataData =
      getCustomerDataFirestoreData(customerData, forFieldValue);
  final nestedData =
      customerDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = customerData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustomerDataFirestoreData(
  CustomerDataStruct? customerData, [
  bool forFieldValue = false,
]) {
  if (customerData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(customerData.toMap());

  // Add any Firestore field values
  customerData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustomerDataListFirestoreData(
  List<CustomerDataStruct>? customerDatas,
) =>
    customerDatas?.map((e) => getCustomerDataFirestoreData(e, true)).toList() ??
    [];
