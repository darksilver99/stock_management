import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryListRecord extends FirestoreRecord {
  CategoryListRecord._(
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

  // "name_list" field.
  List<String>? _nameList;
  List<String> get nameList => _nameList ?? const [];
  bool hasNameList() => _nameList != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _nameList = getDataList(snapshotData['name_list']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('category_list')
          : FirebaseFirestore.instance.collectionGroup('category_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('category_list').doc(id);

  static Stream<CategoryListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryListRecord.fromSnapshot(s));

  static Future<CategoryListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryListRecord.fromSnapshot(s));

  static CategoryListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryListRecordDocumentEquality
    implements Equality<CategoryListRecord> {
  const CategoryListRecordDocumentEquality();

  @override
  bool equals(CategoryListRecord? e1, CategoryListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        listEquality.equals(e1?.nameList, e2?.nameList);
  }

  @override
  int hash(CategoryListRecord? e) =>
      const ListEquality().hash([e?.createDate, e?.createBy, e?.nameList]);

  @override
  bool isValidKey(Object? o) => o is CategoryListRecord;
}
