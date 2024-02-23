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

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  bool hasStock() => _stock != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "price_start" field.
  double? _priceStart;
  double get priceStart => _priceStart ?? 0.0;
  bool hasPriceStart() => _priceStart != null;

  // "price_sell" field.
  double? _priceSell;
  double get priceSell => _priceSell ?? 0.0;
  bool hasPriceSell() => _priceSell != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _deleteDate = snapshotData['delete_date'] as DateTime?;
    _status = castToType<int>(snapshotData['status']);
    _productId = snapshotData['product_id'] as String?;
    _category = snapshotData['category'] as String?;
    _name = snapshotData['name'] as String?;
    _stock = castToType<int>(snapshotData['stock']);
    _photo = snapshotData['photo'] as String?;
    _priceStart = castToType<double>(snapshotData['price_start']);
    _priceSell = castToType<double>(snapshotData['price_sell']);
    _detail = snapshotData['detail'] as String?;
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
  String? productId,
  String? category,
  String? name,
  int? stock,
  String? photo,
  double? priceStart,
  double? priceSell,
  String? detail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'delete_date': deleteDate,
      'status': status,
      'product_id': productId,
      'category': category,
      'name': name,
      'stock': stock,
      'photo': photo,
      'price_start': priceStart,
      'price_sell': priceSell,
      'detail': detail,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductListRecordDocumentEquality implements Equality<ProductListRecord> {
  const ProductListRecordDocumentEquality();

  @override
  bool equals(ProductListRecord? e1, ProductListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.deleteDate == e2?.deleteDate &&
        e1?.status == e2?.status &&
        e1?.productId == e2?.productId &&
        e1?.category == e2?.category &&
        e1?.name == e2?.name &&
        e1?.stock == e2?.stock &&
        e1?.photo == e2?.photo &&
        e1?.priceStart == e2?.priceStart &&
        e1?.priceSell == e2?.priceSell &&
        e1?.detail == e2?.detail;
  }

  @override
  int hash(ProductListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.deleteDate,
        e?.status,
        e?.productId,
        e?.category,
        e?.name,
        e?.stock,
        e?.photo,
        e?.priceStart,
        e?.priceSell,
        e?.detail
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductListRecord;
}
