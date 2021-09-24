import 'package:football_app/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_model.freezed.dart';
part 'table_model.g.dart';

@freezed
class TableModel with _$TableModel {
  const factory TableModel({
    required int position,
    required TeamModel team,
    required int playedGames,
    required int won,
    required int draw,
    required int lost,
    required int points,
    required int goalsFor,
    required int goalsAgainst,
    required int goalDifference,
  }) = _TableModel;

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
}
