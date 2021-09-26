import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/data/models/models.dart';
import 'package:football_app/presentation/blocs/blocs.dart';
import 'package:football_app/presentation/widgets/soccer_loading.dart';
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
          return const SoccerLoading();
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
                    Text(
                      DateFormat(
                        'EEE, d MMM yyyy',
                      ).format(DateTime.parse(matchDates[dateIndex])),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
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
                              color: Colors.white,
                              border: Border.all(color: Colors.indigo.shade100),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'UTC ${DateFormat('HH:mm').format(match.utcDate)} / ${DateFormat('HH:mm').format(match.utcDate.toLocal())} Local Time',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          match.homeTeam.name,
                                          style: awayTeamScore > homeTeamScore
                                              ? const TextStyle(
                                                  fontWeight: FontWeight.w300)
                                              : null,
                                        ),
                                        Text(
                                          match.awayTeam.name,
                                          style: awayTeamScore < homeTeamScore
                                              ? const TextStyle(
                                                  fontWeight: FontWeight.w300)
                                              : null,
                                        )
                                      ],
                                    ),
                                    Text(match.status),
                                    WinnerScore(
                                      awayTeam: awayTeamScore,
                                      homeTeam: homeTeamScore,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 12),
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
