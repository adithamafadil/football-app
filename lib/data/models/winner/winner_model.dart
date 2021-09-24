import 'package:freezed_annotation/freezed_annotation.dart';

part 'winner_model.freezed.dart';
part 'winner_model.g.dart';

@freezed
class WinnerModel with _$WinnerModel {
  const factory WinnerModel({
    required int id,
    required String name,
    required String shortName,
    required String tla,
    required String crestUrl,
  }) = _WinnerModel;

  factory WinnerModel.fromJson(Map<String, dynamic> json) =>
      _$WinnerModelFromJson(json);
}
