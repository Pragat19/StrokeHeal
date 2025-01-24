import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Home/Screens/Stroke_information.dart';
import '../Widget.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signInWithGoogle(context) async {
    try {
      log("In Google------------");
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
        log("$authCredential");
        nextScreen(context, const information_screen());
      }
    } on FirebaseAuthException catch (e) {
      log("$e");
      log("Auth Exception--------$e");

      rethrow;
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
