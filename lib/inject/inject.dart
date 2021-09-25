import 'package:football_app/inject/inject.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// Initialize inject to inject manually.
final inject = GetIt.instance;

/// Configure dependencies method that takes `environment` as [String]
@InjectableInit()
Future<void> configureDependencies() async => $initGetIt(inject);
