import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductListRecord extends FirestoreRecord {
  ProductListRecord._(
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

  // "delete_date" field.
  DateTime? _deleteDate;
  DateTime? get deleteDate => _deleteDate;
  bool hasDeleteDate() => _deleteDate != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "product_category" field.
  String? _productCategory;
  String get productCategory => _productCategory ?? '';
  bool hasProductCategory() => _productCategory != null;

  // "search_data" field.
  List<String>? _searchData;
  List<String> get searchData => _searchData ?? const [];
  bool hasSearchData() => _searchData != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _deleteDate = snapshotData['delete_date'] as DateTime?;
    _status = castToType<int>(snapshotData['status']);
    _productName = snapshotData['product_name'] as String?;
    _productId = snapshotData['product_id'] as String?;
    _productCategory = snapshotData['product_category'] as String?;
    _searchData = getDataList(snapshotData['search_data']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product_list');

  static Stream<ProductListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductListRecord.fromSnapshot(s));

  static Future<ProductListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductListRecord.fromSnapshot(s));

  static ProductListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DateTime? deleteDate,
  int? status,
  String? productName,
  String? productId,
  String? productCategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'delete_date': deleteDate,
      'status': status,
      'product_name': productName,
      'product_id': productId,
      'product_category': productCategory,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductListRecordDocumentEquality implements Equality<ProductListRecord> {
  const ProductListRecordDocumentEquality();

  @override
  bool equals(ProductListRecord? e1, ProductListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.deleteDate == e2?.deleteDate &&
        e1?.status == e2?.status &&
        e1?.productName == e2?.productName &&
        e1?.productId == e2?.productId &&
        e1?.productCategory == e2?.productCategory &&
        listEquality.equals(e1?.searchData, e2?.searchData);
  }

  @override
  int hash(ProductListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.deleteDate,
        e?.status,
        e?.productName,
        e?.productId,
        e?.productCategory,
        e?.searchData
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductListRecord;
}
