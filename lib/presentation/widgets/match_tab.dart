import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/data/models/models.dart';
import 'package:football_app/presentation/blocs/blocs.dart';
import 'package:football_app/presentation/widgets/winner_score.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

class MatchTab extends StatelessWidget {
  const MatchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchBloc, MatchState>(builder: (context, state) {
      return state.matchState.maybeWhen(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        success: () {
          Map<String, List<MatchModel>> groupDate = groupBy(
            state.matchList,
            (MatchModel match) => match.utcDate.toString().substring(0, 10),
          );

          List<String> matchDates = groupDate.keys.toList();

          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: groupDate.length,
            itemBuilder: (context, dateIndex) {
              List<MatchModel> groupedMatches = [];
              for (var element in groupDate.entries) {
                if (element.key == matchDates[dateIndex]) {
                  groupedMatches.addAll(element.value);
                }
              }
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(DateFormat('EEE, d MMM yyyy')
                        .format(DateTime.parse(matchDates[dateIndex]))),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                      ),
                      physics: const ClampingScrollPhysics(),
                      itemCount: groupedMatches.length,
                      itemBuilder: (context, matchIndex) {
                        var match = groupedMatches[matchIndex];
                        int awayTeamScore = match.score.fullTime.awayTeam ?? 0;
                        int homeTeamScore = match.score.fullTime.homeTeam ?? 0;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    '${match.homeTeam.name}\n${match.awayTeam.name}'),
                                Text(match.status),
                                WinnerScore(
                                  awayTeam: awayTeamScore,
                                  homeTeam: homeTeamScore,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            },
          );
        },
        orElse: () {
          return Container();
        },
      );
    });
  }
}
