import 'package:football_app/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition_model.freezed.dart';
part 'competition_model.g.dart';

@freezed
class CompetitionResponseModel with _$CompetitionResponseModel {
  const factory CompetitionResponseModel({
    required int count,
    FilterModel? filters,
    required List<CompetitionModel> competitions,
  }) = _CompetitionResponseModel;

  factory CompetitionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionResponseModelFromJson(json);
}

@freezed
class CompetitionModel with _$CompetitionModel {
  const factory CompetitionModel({
    required int id,
    required AreaModel area,
    required String name,
    String? code,
    String? emblemUrl,
    required String plan,
    SeasonModel? currentSeason,
    int? numberOfAvailableSeasons,
    required DateTime lastUpdated,
  }) = _CompetitionModel;

  factory CompetitionModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionModelFromJson(json);
}

@freezed
class FilterModel with _$FilterModel {
  const factory FilterModel({
    AreaModel? area,
    String? plan,
  }) = _FilterModel;

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);
}
