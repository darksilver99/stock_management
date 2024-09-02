import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IssueListRecord extends FirestoreRecord {
  IssueListRecord._(
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

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "device_data" field.
  String? _deviceData;
  String get deviceData => _deviceData ?? '';
  bool hasDeviceData() => _deviceData != null;

  // "contact_name" field.
  String? _contactName;
  String get contactName => _contactName ?? '';
  bool hasContactName() => _contactName != null;

  // "contact_phone" field.
  String? _contactPhone;
  String get contactPhone => _contactPhone ?? '';
  bool hasContactPhone() => _contactPhone != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _subject = snapshotData['subject'] as String?;
    _detail = snapshotData['detail'] as String?;
    _deviceData = snapshotData['device_data'] as String?;
    _contactName = snapshotData['contact_name'] as String?;
    _contactPhone = snapshotData['contact_phone'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('issue_list');

  static Stream<IssueListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IssueListRecord.fromSnapshot(s));

  static Future<IssueListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IssueListRecord.fromSnapshot(s));

  static IssueListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IssueListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IssueListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IssueListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IssueListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IssueListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIssueListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  String? subject,
  String? detail,
  String? deviceData,
  String? contactName,
  String? contactPhone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'subject': subject,
      'detail': detail,
      'device_data': deviceData,
      'contact_name': contactName,
      'contact_phone': contactPhone,
    }.withoutNulls,
  );

  return firestoreData;
}

class IssueListRecordDocumentEquality implements Equality<IssueListRecord> {
  const IssueListRecordDocumentEquality();

  @override
  bool equals(IssueListRecord? e1, IssueListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.detail == e2?.detail &&
        e1?.deviceData == e2?.deviceData &&
        e1?.contactName == e2?.contactName &&
        e1?.contactPhone == e2?.contactPhone;
  }

  @override
  int hash(IssueListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.subject,
        e?.detail,
        e?.deviceData,
        e?.contactName,
        e?.contactPhone
      ]);

  @override
  bool isValidKey(Object? o) => o is IssueListRecord;
}
