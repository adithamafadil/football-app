import 'package:bloc/bloc.dart';
import 'package:football_app/data/models/models.dart';
import 'package:football_app/data/repositories/competition/competition_remote_repository.dart';
import 'package:football_app/data/states/entity/entity_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'competition_event.dart';
part 'competition_state.dart';
part 'competition_bloc.freezed.dart';

@injectable
class CompetitionBloc extends Bloc<CompetitionEvent, CompetitionState> {
  final CompetitionRemoteRepository _repository;
  CompetitionBloc(this._repository) : super(CompetitionState.initial()) {
    add(const CompetitionEvent.getCompetitions());
  }

  @override
  Stream<CompetitionState> mapEventToState(CompetitionEvent event) async* {
    yield* event.map(getCompetitions: (e) async* {
      yield* _handleGetCompetitions(e);
    }, getSelectedCompetitions: (e) async* {
      yield* _handleGetSelectedCompetitions(e);
    });
  }

  Stream<CompetitionState> _handleGetCompetitions(GetCompetitions e) async* {
    yield state.copyWith(competitionState: const EntityState.loading());

    var result = await _repository.getCompetitions();

    yield* result.map(
      success: (competitionResult) async* {
        yield state.copyWith(
          competitionState: const EntityState.success(),
          competitionList: competitionResult.data.competitions,
        );
      },
      error: (competitionResult) async* {
        yield state.copyWith(
          competitionState: const EntityState.error(),
          competitionList: [],
        );
      },
      connectionError: (competitionResult) async* {
        yield state.copyWith(
          competitionState: const EntityState.connectionError(),
          competitionList: [],
        );
      },
    );
  }

  Stream<CompetitionState> _handleGetSelectedCompetitions(
      GetSelectedCompetitions e) async* {
    yield state.copyWith(selectedCompetition: state.competitionList[e.index]);
  }
}
