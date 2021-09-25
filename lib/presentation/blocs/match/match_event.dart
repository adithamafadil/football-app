part of 'match_bloc.dart';

@freezed
class MatchEvent with _$MatchEvent {
  const factory MatchEvent.getMatch({required String competitionId}) = GetMatch;
}
