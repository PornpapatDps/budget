import 'package:firebase_auth/firebase_auth.dart';

class UserAuthenticator {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    bool _success = false;
    try {
      User? user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).user;
      if (user != null) {
        _success = true;
      }
    } on FirebaseAuthException catch (e) {
      _success = false;
      // Log the specific error message
      print('Sign In Error: ${e.message}');
    } catch (e) {
      _success = false;
      print('An unexpected error occurred: $e');
    }
    return _success;
  }

  Future<bool> registerWithEmailAndPassword(String email, String password) async {
    bool _success = false;
    try {
      User? user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )).user;
      if (user != null) {
        _success = true;
      }
    } on FirebaseAuthException catch (e) {
      _success = false;
      // Log the specific error message
      print('Sign Up Error: ${e.message}');
    } catch (e) {
      _success = false;
      print('An unexpected error occurred: $e');
    }
    return _success;
  }
}
