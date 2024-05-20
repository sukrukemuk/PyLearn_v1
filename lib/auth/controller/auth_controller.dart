import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/user_model.dart';
import '../repository/auth_repository.dart';

// ignore: non_constant_identifier_names
final AuthControllerProvider = Provider(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
  ),
);

class AuthController {
  final AuthRepository authRepository;
  AuthController({
    required this.authRepository,
  });
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return authRepository.signUpWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }

  Future<void> storeUserInfoRoFirebase(UserModel userModel) async {
    return authRepository.storeUserInfoRoFirebase(userModel);
  }
}
