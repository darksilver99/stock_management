import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _appBuildVersion = prefs.getInt('ff_appBuildVersion') ?? _appBuildVersion;
    });
    _safeInit(() {
      _currentDate = prefs.containsKey('ff_currentDate')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_currentDate')!)
          : _currentDate;
    });
    _safeInit(() {
      _isSkipExpireAlert =
          prefs.getBool('ff_isSkipExpireAlert') ?? _isSkipExpireAlert;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
  }

  int _appBuildVersion = 0;
  int get appBuildVersion => _appBuildVersion;
  set appBuildVersion(int value) {
    _appBuildVersion = value;
    prefs.setInt('ff_appBuildVersion', value);
  }

  ConfigDataStruct _configData = ConfigDataStruct();
  ConfigDataStruct get configData => _configData;
  set configData(ConfigDataStruct value) {
    _configData = value;
  }

  void updateConfigDataStruct(Function(ConfigDataStruct) updateFn) {
    updateFn(_configData);
  }

  CustomerDataStruct _customerData = CustomerDataStruct();
  CustomerDataStruct get customerData => _customerData;
  set customerData(CustomerDataStruct value) {
    _customerData = value;
  }

  void updateCustomerDataStruct(Function(CustomerDataStruct) updateFn) {
    updateFn(_customerData);
  }

  DocumentReference? _tmpSelectedProductRef;
  DocumentReference? get tmpSelectedProductRef => _tmpSelectedProductRef;
  set tmpSelectedProductRef(DocumentReference? value) {
    _tmpSelectedProductRef = value;
  }

  List<MonthDataStruct> _monthList = [
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"1\",\"name\":\"มกราคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"2\",\"name\":\"กุมภาพันธ์\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"3\",\"name\":\"มีนาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"4\",\"name\":\"เมษายน\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"5\",\"name\":\"พฤษภาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"6\",\"name\":\"มิถุนายน\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"7\",\"name\":\"กรกฎาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"8\",\"name\":\"สิงหาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"9\",\"name\":\"กันยายน\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"10\",\"name\":\"ตุลาคม\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"11\",\"name\":\"พฤศจิกายน\"}')),
    MonthDataStruct.fromSerializableMap(
        jsonDecode('{\"val\":\"12\",\"name\":\"ธันวาคม\"}'))
  ];
  List<MonthDataStruct> get monthList => _monthList;
  set monthList(List<MonthDataStruct> value) {
    _monthList = value;
  }

  void addToMonthList(MonthDataStruct value) {
    monthList.add(value);
  }

  void removeFromMonthList(MonthDataStruct value) {
    monthList.remove(value);
  }

  void removeAtIndexFromMonthList(int index) {
    monthList.removeAt(index);
  }

  void updateMonthListAtIndex(
    int index,
    MonthDataStruct Function(MonthDataStruct) updateFn,
  ) {
    monthList[index] = updateFn(_monthList[index]);
  }

  void insertAtIndexInMonthList(int index, MonthDataStruct value) {
    monthList.insert(index, value);
  }

  DateTime? _currentDate = DateTime.fromMillisecondsSinceEpoch(1704681060000);
  DateTime? get currentDate => _currentDate;
  set currentDate(DateTime? value) {
    _currentDate = value;
    value != null
        ? prefs.setInt('ff_currentDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_currentDate');
  }

  bool _isSkipExpireAlert = false;
  bool get isSkipExpireAlert => _isSkipExpireAlert;
  set isSkipExpireAlert(bool value) {
    _isSkipExpireAlert = value;
    prefs.setBool('ff_isSkipExpireAlert', value);
  }

  List<AppSuggestDataStruct> _testAppSuggest = [
    AppSuggestDataStruct.fromSerializableMap(jsonDecode(
        '{\"app_name\":\"Hello World\",\"app_image\":\"https://picsum.photos/seed/923/600\",\"app_url\":\"Hello World\"}')),
    AppSuggestDataStruct.fromSerializableMap(jsonDecode(
        '{\"app_name\":\"sssss\",\"app_image\":\"https://picsum.photos/seed/918/600\",\"app_url\":\"Hello World\"}'))
  ];
  List<AppSuggestDataStruct> get testAppSuggest => _testAppSuggest;
  set testAppSuggest(List<AppSuggestDataStruct> value) {
    _testAppSuggest = value;
  }

  void addToTestAppSuggest(AppSuggestDataStruct value) {
    testAppSuggest.add(value);
  }

  void removeFromTestAppSuggest(AppSuggestDataStruct value) {
    testAppSuggest.remove(value);
  }

  void removeAtIndexFromTestAppSuggest(int index) {
    testAppSuggest.removeAt(index);
  }

  void updateTestAppSuggestAtIndex(
    int index,
    AppSuggestDataStruct Function(AppSuggestDataStruct) updateFn,
  ) {
    testAppSuggest[index] = updateFn(_testAppSuggest[index]);
  }

  void insertAtIndexInTestAppSuggest(int index, AppSuggestDataStruct value) {
    testAppSuggest.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
