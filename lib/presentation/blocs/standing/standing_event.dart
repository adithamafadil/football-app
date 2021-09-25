part of 'standing_bloc.dart';

@freezed
class StandingEvent with _$StandingEvent {
  const factory StandingEvent.getStanding({required String competitionId}) =
      GetStanding;
}
