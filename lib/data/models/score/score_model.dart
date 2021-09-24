import 'package:football_app/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_model.freezed.dart';
part 'score_model.g.dart';

@freezed
class ScoreModel with _$ScoreModel {
  const factory ScoreModel({
    required WinnerModel winner,
    required String duration,
    required ScorePerStageModel fullTime,
    required ScorePerStageModel halfTime,
    required ScorePerStageModel extraTime,
    required ScorePerStageModel penalties,
  }) = _ScoreModel;

  factory ScoreModel.fromJson(Map<String, dynamic> json) =>
      _$ScoreModelFromJson(json);
}

@freezed
class ScorePerStageModel with _$ScorePerStageModel {
  const factory ScorePerStageModel({
    int? homeTeam,
    int? awayTeam,
  }) = _ScorePerStageModel;

  factory ScorePerStageModel.fromJson(Map<String, dynamic> json) =>
      _$ScorePerStageModelFromJson(json);
}
