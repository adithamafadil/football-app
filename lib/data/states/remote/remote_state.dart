import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_state.freezed.dart';

@freezed
class RemoteState<T> with _$RemoteState<T> {
  const factory RemoteState.success(T data) = _RemoteStateSuccess;
  const factory RemoteState.error([T? data]) = _RemoteStateError;
  const factory RemoteState.connectionError([T? data]) =
      _RemoteStateConnectionError;
}
