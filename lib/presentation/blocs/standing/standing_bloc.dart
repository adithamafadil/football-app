import 'package:bloc/bloc.dart';
import 'package:football_app/data/models/models.dart';
import 'package:football_app/data/repositories/standing/standing_remote_repository.dart';
import 'package:football_app/data/states/entity/entity_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'standing_event.dart';
part 'standing_state.dart';
part 'standing_bloc.freezed.dart';

@injectable
class StandingBloc extends Bloc<StandingEvent, StandingState> {
  final StandingRemoteRepository _repository;

  StandingBloc(this._repository) : super(StandingState.initial());

  @override
  Stream<StandingState> mapEventToState(StandingEvent event) async* {
    yield* event.map(getStanding: (e) async* {
      yield* _handleGetStanding(e);
    });
  }

  Stream<StandingState> _handleGetStanding(GetStanding e) async* {
    yield state.copyWith(standingState: const EntityState.loading());

    var result = await _repository.getStandings(e.competitionId);

    yield* result.map(
      success: (standingResult) async* {
        yield state.copyWith(
          standingState: const EntityState.success(),
          standingList: standingResult.data.standings,
        );
      },
      error: (standingResult) async* {
        yield state.copyWith(
          standingState: const EntityState.error(),
          standingList: [],
        );
      },
      connectionError: (standingResult) async* {
        yield state.copyWith(
          standingState: const EntityState.connectionError(),
          standingList: [],
        );
      },
    );
  }
}
