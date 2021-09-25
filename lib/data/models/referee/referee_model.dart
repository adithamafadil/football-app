import 'package:freezed_annotation/freezed_annotation.dart';

part 'referee_model.freezed.dart';
part 'referee_model.g.dart';

@freezed
class RefereeModel with _$RefereeModel {
  const factory RefereeModel({
    required int id,
    required String name,
    required String role,
    String? nationality,
  }) = _RefereeModel;

  factory RefereeModel.fromJson(Map<String, dynamic> json) =>
      _$RefereeModelFromJson(json);
}
