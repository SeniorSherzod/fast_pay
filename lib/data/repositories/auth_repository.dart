import 'package:fast_pay/data/models/exceptions/firebase_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/network_response.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<NetworkResponse> logInWithEmailAndPassword({
    required String email, required String password
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorText: LogInWithEmailAndPasswordFailure.fromCode(e.code).message,
        errorCode: e.code,
      );
    } catch (error) {
      print('ERROR: ${error.toString()}');
      return NetworkResponse(errorText: "An unknown exception occurred.${error}");
    }
  }

  Future<NetworkResponse> registerWithEmailAndPassword({
    required String email, required String password
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorText: SignUpWithEmailAndPasswordFailure.fromCode(e.code).message,
        errorCode: e.code,
      );
    } catch (error) {
      print('ERROR: ${error.toString()}');
      return NetworkResponse(errorText: "An unknown exception occurred.");
    }
  }

  Future<NetworkResponse> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorCode:LogInWithEmailAndPasswordFailure.fromCode(e.code).message,
      );
    } catch (error) {
      print('ERROR: ${error.toString()}');
      return NetworkResponse(errorText: "An unknown exception occurred.");
    }
  }

  Future<NetworkResponse> logOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      return NetworkResponse(data: "success");
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorText: "Error",
        errorCode: e.code,
      );
    } catch (error) {
      print('ERROR: ${error.toString()}');
      return NetworkResponse(errorText: "An unknown exception occurred.");
    }
  }
}
