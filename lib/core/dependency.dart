import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:smith/core/dependency.config.dart';

final GetIt getIt = GetIt.instance;

// run flutter pub run build_runner build --delete-conflicting-outputs
@injectableInit
void configureDependencies() => getIt.init();
