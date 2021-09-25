part of 'match_bloc.dart';

@freezed
class MatchState with _$MatchState {
  const factory MatchState({
    required EntityState matchState,
    required List<MatchModel> matchList,
  }) = _MatchState;

  factory MatchState.initial() => const MatchState(
        matchState: EntityState.loading(),
        matchList: [],
      );
}
