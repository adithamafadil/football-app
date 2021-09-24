import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_state.freezed.dart';

@freezed
class EntityState with _$EntityState {
  const factory EntityState.loading() = _EntityStateLoading;
  const factory EntityState.success() = _EntityStateSuccess;
  const factory EntityState.error() = _EntityStateError;
  const factory EntityState.connectionError() = _EntityStateConnectionError;
}
