import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:our_pass_test/data/firebase/auth_repository.dart';
import 'package:our_pass_test/provider/SignUpProvider.dart';
import 'package:our_pass_test/provider/login_provider.dart';
import 'package:our_pass_test/provider/ui_manager.dart';

final GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  final injectableModules = InjectableFactory.instance;

  locator.registerSingleton<IAuthRepository>(
    AuthRepository(injectableModules.auth),
  );

  locator.registerSingleton<LoginProvider>(
      LoginProvider(authRepository: locator()));

  locator.registerSingleton<SignUpProvider>(
    SignUpProvider(authRepository: locator()),
  );

  locator.registerSingleton<UiManager>(
    UiManager(),
  );
}

abstract class InjectableModules {
  FirebaseAuth get auth;
}

class InjectableModulesProd implements InjectableModules {
  @override
  FirebaseAuth auth = FirebaseAuth.instance;
}

class InjectableFactory {
  static InjectableModules get instance {
    return InjectableModulesProd();
  }
}
