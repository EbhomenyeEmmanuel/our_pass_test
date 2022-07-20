import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<Either<Failure, R>> safeNetworkResult<R>(
    Future<R> Function() call) async {
  try {
    final result = await call();
    return Right(result);
  } on FirebaseAuthException catch (e) {
    return Left(
        Failure(e.message != null ? e.message! : "Something went wrong"));
  } on SocketException catch (e) {
    return Left(Failure(e.message));
  } catch (error, stacktrace) {
    debugPrint("Catch error: $error");
    debugPrint("$stacktrace");
    return Left(Failure("Something went wrong"));
  }
}

class Failure {
  final String message;

  Failure(this.message);
}
