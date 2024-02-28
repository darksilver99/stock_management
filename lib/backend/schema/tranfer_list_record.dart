import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TranferListRecord extends FirestoreRecord {
  TranferListRecord._(
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

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "total_amount" field.
  int? _totalAmount;
  int get totalAmount => _totalAmount ?? 0;
  bool hasTotalAmount() => _totalAmount != null;

  // "total_price_start" field.
  double? _totalPriceStart;
  double get totalPriceStart => _totalPriceStart ?? 0.0;
  bool hasTotalPriceStart() => _totalPriceStart != null;

  // "total_price_sell" field.
  double? _totalPriceSell;
  double get totalPriceSell => _totalPriceSell ?? 0.0;
  bool hasTotalPriceSell() => _totalPriceSell != null;

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  bool hasRemark() => _remark != null;

  // "product_cate" field.
  String? _productCate;
  String get productCate => _productCate ?? '';
  bool hasProductCate() => _productCate != null;

  // "total_remain" field.
  int? _totalRemain;
  int get totalRemain => _totalRemain ?? 0;
  bool hasTotalRemain() => _totalRemain != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _type = snapshotData['type'] as String?;
    _totalAmount = castToType<int>(snapshotData['total_amount']);
    _totalPriceStart = castToType<double>(snapshotData['total_price_start']);
    _totalPriceSell = castToType<double>(snapshotData['total_price_sell']);
    _productRef = snapshotData['product_ref'] as DocumentReference?;
    _productName = snapshotData['product_name'] as String?;
    _productId = snapshotData['product_id'] as String?;
    _remark = snapshotData['remark'] as String?;
    _productCate = snapshotData['product_cate'] as String?;
    _totalRemain = castToType<int>(snapshotData['total_remain']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tranfer_list');

  static Stream<TranferListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TranferListRecord.fromSnapshot(s));

  static Future<TranferListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TranferListRecord.fromSnapshot(s));

  static TranferListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TranferListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TranferListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TranferListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TranferListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TranferListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTranferListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  int? status,
  String? type,
  int? totalAmount,
  double? totalPriceStart,
  double? totalPriceSell,
  DocumentReference? productRef,
  String? productName,
  String? productId,
  String? remark,
  String? productCate,
  int? totalRemain,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'status': status,
      'type': type,
      'total_amount': totalAmount,
      'total_price_start': totalPriceStart,
      'total_price_sell': totalPriceSell,
      'product_ref': productRef,
      'product_name': productName,
      'product_id': productId,
      'remark': remark,
      'product_cate': productCate,
      'total_remain': totalRemain,
    }.withoutNulls,
  );

  return firestoreData;
}

class TranferListRecordDocumentEquality implements Equality<TranferListRecord> {
  const TranferListRecordDocumentEquality();

  @override
  bool equals(TranferListRecord? e1, TranferListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status &&
        e1?.type == e2?.type &&
        e1?.totalAmount == e2?.totalAmount &&
        e1?.totalPriceStart == e2?.totalPriceStart &&
        e1?.totalPriceSell == e2?.totalPriceSell &&
        e1?.productRef == e2?.productRef &&
        e1?.productName == e2?.productName &&
        e1?.productId == e2?.productId &&
        e1?.remark == e2?.remark &&
        e1?.productCate == e2?.productCate &&
        e1?.totalRemain == e2?.totalRemain;
  }

  @override
  int hash(TranferListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.status,
        e?.type,
        e?.totalAmount,
        e?.totalPriceStart,
        e?.totalPriceSell,
        e?.productRef,
        e?.productName,
        e?.productId,
        e?.remark,
        e?.productCate,
        e?.totalRemain
      ]);

  @override
  bool isValidKey(Object? o) => o is TranferListRecord;
}
