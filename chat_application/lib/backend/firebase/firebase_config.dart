import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCHdp8UIWQ2LYo2t6_BzsayUM6p-qHSMjc",
            authDomain: "chat-application-p00y63.firebaseapp.com",
            projectId: "chat-application-p00y63",
            storageBucket: "chat-application-p00y63.appspot.com",
            messagingSenderId: "837475935142",
            appId: "1:837475935142:web:1d3d749952f8f78759e567"));
  } else {
    await Firebase.initializeApp();
  }
}
