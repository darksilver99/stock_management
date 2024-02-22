import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB2elTtEVH4LOC0FQo4o4KS5P6i9i8aZQg",
            authDomain: "stock-management-24cnak.firebaseapp.com",
            projectId: "stock-management-24cnak",
            storageBucket: "stock-management-24cnak.appspot.com",
            messagingSenderId: "888557168638",
            appId: "1:888557168638:web:71d4dd75a34d559f6302af"));
  } else {
    await Firebase.initializeApp();
  }
}
