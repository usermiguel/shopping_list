import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGoogleUtils {
  static const String TAG = "LoginGoogleUtils";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  //GOOGLE METHODS
  //SIGNIN WHITH GOOGLE
  Future<User> signInWithGoogle() async {
    log(TAG + ",signWithGoogle() init ..");

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    log(TAG +
        ",signWithGoogle() googleUser email -> ${googleSignInAccount.email}");

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    User user = userCredential.user;

    return isCurrentSignIn(user);
  }

  Future<User> isCurrentSignIn(User user) async {
    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      log(TAG + ", signWhitGoogle succeded: $user");

      return user;
    }
    return null;
  }
}
