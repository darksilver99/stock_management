import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuggestListRecord extends FirestoreRecord {
  SuggestListRecord._(
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

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _subject = snapshotData['subject'] as String?;
    _detail = snapshotData['detail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('suggest_list');

  static Stream<SuggestListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuggestListRecord.fromSnapshot(s));

  static Future<SuggestListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SuggestListRecord.fromSnapshot(s));

  static SuggestListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuggestListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuggestListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuggestListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuggestListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuggestListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuggestListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  String? subject,
  String? detail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'subject': subject,
      'detail': detail,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuggestListRecordDocumentEquality implements Equality<SuggestListRecord> {
  const SuggestListRecordDocumentEquality();

  @override
  bool equals(SuggestListRecord? e1, SuggestListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.subject == e2?.subject &&
        e1?.detail == e2?.detail;
  }

  @override
  int hash(SuggestListRecord? e) => const ListEquality()
      .hash([e?.createDate, e?.createBy, e?.subject, e?.detail]);

  @override
  bool isValidKey(Object? o) => o is SuggestListRecord;
}
