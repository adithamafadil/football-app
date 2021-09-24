import 'package:football_app/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'standing_model.freezed.dart';
part 'standing_model.g.dart';

@freezed
class StandingResponseModel with _$StandingResponseModel {
  const factory StandingResponseModel({
    required CompetitionModel competition,
    required SeasonModel season,
    required List<StandingModel> standings,
  }) = _StandingResponseModel;

  factory StandingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StandingResponseModelFromJson(json);
}

@freezed
class StandingModel with _$StandingModel {
  const factory StandingModel({
    required String stage,
    required String type,
    required List<TableModel> table,
  }) = _StandingModel;
  factory StandingModel.fromJson(Map<String, dynamic> json) =>
      _$StandingModelFromJson(json);
}
