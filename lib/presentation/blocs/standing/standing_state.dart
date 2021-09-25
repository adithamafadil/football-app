part of 'standing_bloc.dart';

@freezed
class StandingState with _$StandingState {
  const factory StandingState({
    required EntityState standingState,
    required List<StandingModel> standingList,
  }) = _StandingState;

  factory StandingState.initial() => const StandingState(
        standingState: EntityState.loading(),
        standingList: [],
      );
}
