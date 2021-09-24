import 'package:football_app/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'season_model.freezed.dart';
part 'season_model.g.dart';

@freezed
class SeasonModel with _$SeasonModel {
  const factory SeasonModel({
    required int id,
    required DateTime startDate,
    required DateTime endDate,
    int? currentMatchday,
    WinnerModel? winner,
  }) = _SeasonModel;

  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);
}
