import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:habit_app/core/providers/loading_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = ChangeNotifierProvider<Auth>((ref) => Auth(ref));

final userProvider = StreamProvider<User?>((ref) {
  final auth = ref.read(authProvider);
  return auth.userStream;
});

class Auth extends ChangeNotifier {
  final Ref _ref;
  Auth(this._ref);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get userStream => _auth.authStateChanges();

  Loading get _loading => _ref.read(loadingProvider);

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  bool _obscureText = true;
  bool get obscureText => _obscureText;
  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  bool get enabled =>
      _email.isNotEmpty && _password.isNotEmpty && _name.isNotEmpty;
  bool get loginEnabled => _email.isNotEmpty && _password.isNotEmpty;

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    try {
      _loading.start();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _auth.signInWithCredential(credential);
      _loading.end();
    } on FirebaseAuthException catch (e) {
      _loading.stop();
      return Future.error(e.message ?? e.code);
    } catch (e) {
      _loading.stop();
      return Future.error(e);
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      _loading.start();
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      if (loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        _auth.signInWithCredential(facebookAuthCredential);
      } else {
        return Future.error('Facebook login failed');
      }

      // Once signed in, return the UserCredential
      _loading.end();
    } on FirebaseAuthException catch (e) {
      _loading.stop();

      return Future.error(e.message ?? e.code);
    } catch (e) {
      _loading.stop();
      return Future.error(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> reload() async {
    await _auth.currentUser?.reload();
  }

  Future<void> login() async {
    _loading.start();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _loading.end();
    } on FirebaseAuthException catch (e) {
      _loading.stop();

      return Future.error(e.message ?? e.code);
    } catch (e) {
      _loading.stop();
      return Future.error(e);
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message ?? e.code);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message ?? e.code);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> register() async {
    _loading.start();

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      sendVerificationEmail();
      _loading.end();
    } on FirebaseAuthException catch (e) {
      _loading.stop();
      return Future.error(e.message ?? e.code);
    } catch (e) {
      _loading.stop();
      return Future.error(e);
    }
  }
}
