import 'package:football_app/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
class MatchResponseModel with _$MatchResponseModel {
  const factory MatchResponseModel({
    required int count,
    required CompetitionModel competition,
    required List<MatchModel> matches,
  }) = _MatchResponseModel;

  factory MatchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MatchResponseModelFromJson(json);
}

@freezed
class MatchModel with _$MatchModel {
  const factory MatchModel({
    required int id,
    required SeasonModel season,
    required DateTime utcDate,
    required String status,
    required int matchday,
    required String stage,
    required DateTime lastUpdated,
    required OddModel odds,
    required ScoreModel score,
    required AreaModel homeTeam,
    required AreaModel awayTeam,
    required List<RefereeModel> referees,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
}
