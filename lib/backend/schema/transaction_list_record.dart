import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionListRecord extends FirestoreRecord {
  TransactionListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

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

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  bool hasRemark() => _remark != null;

  // "total_remain" field.
  int? _totalRemain;
  int get totalRemain => _totalRemain ?? 0;
  bool hasTotalRemain() => _totalRemain != null;

  // "current_price_start" field.
  double? _currentPriceStart;
  double get currentPriceStart => _currentPriceStart ?? 0.0;
  bool hasCurrentPriceStart() => _currentPriceStart != null;

  // "current_price_sell" field.
  double? _currentPriceSell;
  double get currentPriceSell => _currentPriceSell ?? 0.0;
  bool hasCurrentPriceSell() => _currentPriceSell != null;

  // "keyword_list" field.
  List<String>? _keywordList;
  List<String> get keywordList => _keywordList ?? const [];
  bool hasKeywordList() => _keywordList != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _status = castToType<int>(snapshotData['status']);
    _type = snapshotData['type'] as String?;
    _totalAmount = castToType<int>(snapshotData['total_amount']);
    _totalPriceStart = castToType<double>(snapshotData['total_price_start']);
    _totalPriceSell = castToType<double>(snapshotData['total_price_sell']);
    _productRef = snapshotData['product_ref'] as DocumentReference?;
    _productName = snapshotData['product_name'] as String?;
    _remark = snapshotData['remark'] as String?;
    _totalRemain = castToType<int>(snapshotData['total_remain']);
    _currentPriceStart =
        castToType<double>(snapshotData['current_price_start']);
    _currentPriceSell = castToType<double>(snapshotData['current_price_sell']);
    _keywordList = getDataList(snapshotData['keyword_list']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('transaction_list')
          : FirebaseFirestore.instance.collectionGroup('transaction_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('transaction_list').doc(id);

  static Stream<TransactionListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionListRecord.fromSnapshot(s));

  static Future<TransactionListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionListRecord.fromSnapshot(s));

  static TransactionListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionListRecordData({
  DateTime? createDate,
  int? status,
  String? type,
  int? totalAmount,
  double? totalPriceStart,
  double? totalPriceSell,
  DocumentReference? productRef,
  String? productName,
  String? remark,
  int? totalRemain,
  double? currentPriceStart,
  double? currentPriceSell,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'status': status,
      'type': type,
      'total_amount': totalAmount,
      'total_price_start': totalPriceStart,
      'total_price_sell': totalPriceSell,
      'product_ref': productRef,
      'product_name': productName,
      'remark': remark,
      'total_remain': totalRemain,
      'current_price_start': currentPriceStart,
      'current_price_sell': currentPriceSell,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionListRecordDocumentEquality
    implements Equality<TransactionListRecord> {
  const TransactionListRecordDocumentEquality();

  @override
  bool equals(TransactionListRecord? e1, TransactionListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.status == e2?.status &&
        e1?.type == e2?.type &&
        e1?.totalAmount == e2?.totalAmount &&
        e1?.totalPriceStart == e2?.totalPriceStart &&
        e1?.totalPriceSell == e2?.totalPriceSell &&
        e1?.productRef == e2?.productRef &&
        e1?.productName == e2?.productName &&
        e1?.remark == e2?.remark &&
        e1?.totalRemain == e2?.totalRemain &&
        e1?.currentPriceStart == e2?.currentPriceStart &&
        e1?.currentPriceSell == e2?.currentPriceSell &&
        listEquality.equals(e1?.keywordList, e2?.keywordList);
  }

  @override
  int hash(TransactionListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.status,
        e?.type,
        e?.totalAmount,
        e?.totalPriceStart,
        e?.totalPriceSell,
        e?.productRef,
        e?.productName,
        e?.remark,
        e?.totalRemain,
        e?.currentPriceStart,
        e?.currentPriceSell,
        e?.keywordList
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionListRecord;
}
