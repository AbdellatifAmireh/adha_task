import 'package:adha_task/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:adha_task/src/features/core/screens/landing/landing_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../features/authentication/screens/welcome/welcome_screen.dart';
import '../exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  //All data from user if he login and keep him login
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);

    //To check if any changes happened like logged in or logged out
    firebaseUser.bindStream(_auth.userChanges());

    //ever always ready to perform any action
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    //If the user logged out or logged in it will redirect him
    user == null
        ? Get.offAll(() => const TSplashScreen())
        : Get.offAll(() => const LandingScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //redirect him if he successfully signed up
      firebaseUser.value != null
          ? Get.offAll(() => const LandingScreen())
          : Get.to(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const LandingScreen())
          : Get.to(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
