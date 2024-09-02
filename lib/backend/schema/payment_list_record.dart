import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentListRecord extends FirestoreRecord {
  PaymentListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "image_slip" field.
  String? _imageSlip;
  String get imageSlip => _imageSlip ?? '';
  bool hasImageSlip() => _imageSlip != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "customer_ref" field.
  DocumentReference? _customerRef;
  DocumentReference? get customerRef => _customerRef;
  bool hasCustomerRef() => _customerRef != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _subject = snapshotData['subject'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _imageSlip = snapshotData['image_slip'] as String?;
    _detail = snapshotData['detail'] as String?;
    _customerName = snapshotData['customer_name'] as String?;
    _customerRef = snapshotData['customer_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payment_list');

  static Stream<PaymentListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentListRecord.fromSnapshot(s));

  static Future<PaymentListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentListRecord.fromSnapshot(s));

  static PaymentListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  String? subject,
  double? price,
  String? imageSlip,
  String? detail,
  String? customerName,
  DocumentReference? customerRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'subject': subject,
      'price': price,
      'image_slip': imageSlip,
      'detail': detail,
      'customer_name': customerName,
      'customer_ref': customerRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentListRecordDocumentEquality implements Equality<PaymentListRecord> {
  const PaymentListRecordDocumentEquality();

  @override
  bool equals(PaymentListRecord? e1, PaymentListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.price == e2?.price &&
        e1?.imageSlip == e2?.imageSlip &&
        e1?.detail == e2?.detail &&
        e1?.customerName == e2?.customerName &&
        e1?.customerRef == e2?.customerRef;
  }

  @override
  int hash(PaymentListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.subject,
        e?.price,
        e?.imageSlip,
        e?.detail,
        e?.customerName,
        e?.customerRef
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentListRecord;
}
