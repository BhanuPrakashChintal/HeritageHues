import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAQpq8Pr0MkZpblp6crrVJxvcNHeKf6av4",
            authDomain: "heritage-hues-ezez7i.firebaseapp.com",
            projectId: "heritage-hues-ezez7i",
            storageBucket: "heritage-hues-ezez7i.appspot.com",
            messagingSenderId: "540935967138",
            appId: "1:540935967138:web:a115d45f93e08d929b22fb"));
  } else {
    await Firebase.initializeApp();
  }
}
