import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@module
abstract class InjectModules {
  @lazySingleton
  http.Client get client => http.Client();
}
