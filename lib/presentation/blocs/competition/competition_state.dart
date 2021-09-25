part of 'competition_bloc.dart';

@freezed
class CompetitionState with _$CompetitionState {
  const factory CompetitionState({
    required EntityState competitionState,
    required List<CompetitionModel> competitionList,
  }) = _CompetitionState;

  factory CompetitionState.initial() => const CompetitionState(
        competitionState: EntityState.loading(),
        competitionList: [],
      );
}
