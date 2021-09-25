import 'package:bloc/bloc.dart';
import 'package:football_app/data/models/models.dart';
import 'package:football_app/data/repositories/match/match_remote_repository.dart';
import 'package:football_app/data/states/entity/entity_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'match_event.dart';
part 'match_state.dart';
part 'match_bloc.freezed.dart';

@injectable
class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final MatchRemoteRepository _repository;
  MatchBloc(this._repository) : super(MatchState.initial());

  @override
  Stream<MatchState> mapEventToState(MatchEvent event) async* {
    yield* event.map(getMatch: (e) async* {
      yield* _handleGetMatch(e);
    });
  }

  Stream<MatchState> _handleGetMatch(GetMatch e) async* {
    yield state.copyWith(matchState: const EntityState.loading());

    var result = await _repository.getMatches(e.competitionId);

    yield* result.map(
      success: (matchResult) async* {
        yield state.copyWith(
          matchState: const EntityState.success(),
          matchList: matchResult.data.matches,
        );
      },
      error: (matchResult) async* {
        yield state.copyWith(
          matchState: const EntityState.error(),
          matchList: [],
        );
      },
      connectionError: (matchResult) async* {
        yield state.copyWith(
          matchState: const EntityState.connectionError(),
          matchList: [],
        );
      },
    );
  }
}
