import 'package:flutter/material.dart';
import '/backend/backend.dart';
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
      _isTesting = prefs.getBool('ff_isTesting') ?? _isTesting;
    });
    _safeInit(() {
      _androidStoreLink =
          prefs.getString('ff_androidStoreLink') ?? _androidStoreLink;
    });
    _safeInit(() {
      _iosStoreLink = prefs.getString('ff_iosStoreLink') ?? _iosStoreLink;
    });
    _safeInit(() {
      _isEnableAd = prefs.getBool('ff_isEnableAd') ?? _isEnableAd;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _test = '';
  String get test => _test;
  set test(String value) {
    _test = value;
  }

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

  bool _isTesting = false;
  bool get isTesting => _isTesting;
  set isTesting(bool value) {
    _isTesting = value;
    prefs.setBool('ff_isTesting', value);
  }

  String _androidStoreLink = '';
  String get androidStoreLink => _androidStoreLink;
  set androidStoreLink(String value) {
    _androidStoreLink = value;
    prefs.setString('ff_androidStoreLink', value);
  }

  String _iosStoreLink = '';
  String get iosStoreLink => _iosStoreLink;
  set iosStoreLink(String value) {
    _iosStoreLink = value;
    prefs.setString('ff_iosStoreLink', value);
  }

  int _storeBuildVersion = 0;
  int get storeBuildVersion => _storeBuildVersion;
  set storeBuildVersion(int value) {
    _storeBuildVersion = value;
  }

  bool _isEnableAd = false;
  bool get isEnableAd => _isEnableAd;
  set isEnableAd(bool value) {
    _isEnableAd = value;
    prefs.setBool('ff_isEnableAd', value);
  }

  int _price = 0;
  int get price => _price;
  set price(int value) {
    _price = value;
  }

  int _fullPrice = 0;
  int get fullPrice => _fullPrice;
  set fullPrice(int value) {
    _fullPrice = value;
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
