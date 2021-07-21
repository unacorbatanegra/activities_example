import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';

class DeepLoginController extends GetxController {
  final firebaseAuthUser = Rxn<User>();
  final _isLogged = false.obs;
  final _isLoading = false.obs;
  final AuthDomain? authDomain;

  DeepLoginController({this.authDomain});
  @override
  void onInit() {
    super.onInit();
    _isLogged.value = FirebaseAuth.instance.currentUser != null;
    ever<bool>(
      _isLogged,
      (e) async {
        if (e && !isLoading) {
          _isLoading(true);
          await authDomain!.checkExistUser(firebaseAuthUser()!.uid);
          _isLoading(false);
        }
      },
    );
    firebaseAuthUser.bindStream(FirebaseAuth.instance.authStateChanges());
    firebaseAuthUser.listen(
      (user) async {
        _isLogged.value = user?.uid != null;
      },
    );
  }

  bool get isLoading => _isLoading.value;
  bool get isLogged => _isLogged.value;
}
