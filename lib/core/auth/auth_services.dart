import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:noteee/models/app_user/app_user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionHandler.handleException(e);
    }
  }

  // ✅ Updated to take fullName and save to Firestore
  Future<void> registerWithEmail(
    String email,
    String password,
    String fullName,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user!;
      final appUser = AppUser(
        uid: user.uid,
        name: fullName,
        email: email,
        photoUrl: null,
        password: password,
      );

      await _saveUserToFirestore(appUser);
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionHandler.handleException(e);
    }
  }

  // ✅ Save Google user info to Firestore if new
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user!;

      final userDoc = await _firestore.collection('users').doc(user.uid).get();

      if (!userDoc.exists) {
        final appUser = AppUser(
          uid: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          photoUrl: user.photoURL,
        );
        await _saveUserToFirestore(appUser);
      }
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionHandler.handleException(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionHandler.handleException(e);
    }
  }

  // ✅ Save user info to Firestore
  Future<void> _saveUserToFirestore(AppUser user) async {
    await _firestore.collection('users').doc(user.uid).set(user.toMap());
  }

  // ✅ Get current user from Firestore
  Future<AppUser?> getCurrentAppUser() async {
    final current = _auth.currentUser;
    if (current == null) return null;

    final doc = await _firestore.collection('users').doc(current.uid).get();
    if (!doc.exists) return null;

    return AppUser.fromMap(doc.data()!);
  }
}

class AuthExceptionHandler {
  static String handleException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'email-already-in-use':
        return 'Email is already in use.';
      case 'invalid-email':
        return 'Invalid email address.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'network-request-failed':
        return 'Check your internet connection.';
      case 'expired-action-code':
        return 'The password reset link has expired.';
      case 'invalid-action-code':
        return 'The password reset code is invalid.';
      default:
        return 'An unexpected error occurred.';
    }
  }
}
