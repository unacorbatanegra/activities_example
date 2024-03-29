import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:google_sign_in/google_sign_in.dart';

import '../../insfrastructure/hive_setting.dart';
import '../../models/models.dart';
import '../domain.dart';
import '../domains.dart';

class AuthDomain extends Domain<User> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn.standard();

  UserDomain userDomain = UserDomain();

  Future<void> loginGoogle() async {
    await signOut();
    final result = await googleSignIn.signIn();
    if (result == null) return;
    final googleAuth = await result.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _signIn(credential);
  }

  Future<void> loginAnonymously() async {
    await signOut();
    final result = await firebaseAuth.signInAnonymously();

    print(result.user!.displayName);
    HiveHelperSettings.put('isAnonymous', result.user!.isAnonymous);
  }

  Future<void> _signIn(OAuthCredential credential) async {
    final userCredential = await firebaseAuth.signInWithCredential(credential);
    HiveHelperSettings.put('isAnonymous', userCredential.user!.isAnonymous);
    if (!await checkExistUser(userCredential.user!.uid)) {
      final user = userCredential.user!;
      await userDomain.put(
        User(
          email: user.email,
          user: user.displayName ?? '',
          uid: user.uid,
          urlImg: user.photoURL ?? '',
          phone: user.phoneNumber ?? '',
        ),
      );
    }
  }

  Future<bool> checkExistUser(String uuid) => userDomain.checkExistUser(uuid);

  Future<void> signOut() {
    return Future.wait(
      [
        firebaseAuth.signOut(),
        googleSignIn.signOut(),
      ],
    );
  }
}
