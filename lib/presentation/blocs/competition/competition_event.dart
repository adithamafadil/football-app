part of 'competition_bloc.dart';

@freezed
class CompetitionEvent with _$CompetitionEvent {
  const factory CompetitionEvent.getCompetitions() = GetCompetitions;
  const factory CompetitionEvent.getSelectedCompetitions({required int index}) =
      GetSelectedCompetitions;
}
