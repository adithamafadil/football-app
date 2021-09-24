import 'package:freezed_annotation/freezed_annotation.dart';

part 'odd_model.freezed.dart';
part 'odd_model.g.dart';

@freezed
class OddModel with _$OddModel {
  const factory OddModel({required String msg}) = _OddModel;

  factory OddModel.fromJson(Map<String, dynamic> json) =>
      _$OddModelFromJson(json);
}
