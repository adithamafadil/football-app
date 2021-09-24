import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:football_app/data/config/api_config.dart';
import 'package:football_app/data/models/competition/competition_model.dart';
import 'package:football_app/data/states/remote/remote_state.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class CompetitionRemoteRepository {
  final ApiConfig _apiConfig;
  final http.Client _client;

  const CompetitionRemoteRepository(this._apiConfig, this._client);

  Future<RemoteState<CompetitionResponseModel>> getCompetitions() async {
    try {
      String url = '${_apiConfig.url}'
          '?areas=2072,2224,2114,2081,2088,2163,2187&plan=TIER_ONE';

      var response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return RemoteState.success(CompetitionResponseModel.fromJson(
          json.decode(response.body),
        ));
      } else {
        return RemoteState.error(CompetitionResponseModel.fromJson(
          json.decode(response.body),
        ));
      }
    } on SocketException catch (e, stack) {
      log('Device has no connection. $e\n' 'On Stack: $stack');
      return const RemoteState.connectionError();
    } on TimeoutException catch (e, stack) {
      log('Connection timeout: $e\n' 'On Stack: $stack');
      return const RemoteState.connectionError();
    } catch (e, stack) {
      log('Unhandled Exception Error: $e\n' 'On Stack: $stack');
      return const RemoteState.error();
    }
  }
}
