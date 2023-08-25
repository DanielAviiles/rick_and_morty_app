import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  /* @injectable
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @injectable
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance; */
}
