import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:football_app/data/config/api_config.dart';
import 'package:football_app/data/config/header_config.dart';
import 'package:football_app/data/models/match/match_model.dart';
import 'package:football_app/data/states/remote/remote_state.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@lazySingleton
class MatchRemoteRepository {
  final ApiConfig _apiConfig;
  final http.Client _client;
  final HeaderConfig _headerConfig;

  const MatchRemoteRepository(
    this._apiConfig,
    this._client,
    this._headerConfig,
  );

  Future<RemoteState<MatchResponseModel>> getMatches(
      String competitionId) async {
    try {
      String dateFrom = DateFormat(('yyyy-MM-dd'))
          .format(DateTime.now().add(const Duration(days: -14)));
      String dateTo = DateFormat(('yyyy-MM-dd'))
          .format(DateTime.now().add(const Duration(days: 14)));

      String url =
          '${_apiConfig.url}/$competitionId/matches?dateFrom=$dateFrom&dateTo=$dateTo';

      var response = await _client.get(Uri.parse(url), headers: {
        'X-auth-Token': _headerConfig.header,
      });

      if (response.statusCode == 200) {
        return RemoteState.success(MatchResponseModel.fromJson(
          json.decode(response.body),
        ));
      } else {
        return RemoteState.error(MatchResponseModel.fromJson(
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
