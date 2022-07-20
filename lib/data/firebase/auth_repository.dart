import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:our_pass_test/data/network/network_helper.dart';

abstract class IAuthRepository {
  Future<Either<Failure, UserCredential>> signIn(String email, String password);

  Future<Either<Failure, UserCredential>> signUp(String email, String password);

  Future<void> signOut();
}

class AuthRepository implements IAuthRepository {
  final FirebaseAuth auth;

  AuthRepository(this.auth);

  @override
  Future<Either<Failure, UserCredential>> signIn(
      String email, String password) async {
    return safeNetworkResult(() async {
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    });
  }

  @override
  Future<Either<Failure, UserCredential>> signUp(
      String email, String password) async {
    return safeNetworkResult(() async {
      return await auth.signInWithEmailAndPassword(
          email: email, password: password);
    });
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}
