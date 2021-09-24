import 'package:injectable/injectable.dart';

/// `ApiConfig` an abstract class that will be filled API URL and manage the flavor later
abstract class ApiConfig {
  late String url;
}

/// `FootballApi` that will alias into [ApiConfig] with `production` environment.
@Environment('production')
@LazySingleton(as: ApiConfig)
class FootballApi implements ApiConfig {
  @override
  String url = 'https://api.football-data.org/v2/';
}
