import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/presentation/blocs/blocs.dart';
import 'package:football_app/presentation/blocs/competition/competition_bloc.dart';
import 'package:football_app/presentation/widgets/soccer_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Competitions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<CompetitionBloc, CompetitionState>(
          builder: (context, state) {
            return state.competitionState.maybeWhen(
              loading: () {
                return const SoccerLoading();
              },
              success: () {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.25,
                  ),
                  itemCount: state.competitionList.length,
                  itemBuilder: (context, index) {
                    var competition = state.competitionList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          context.read<CompetitionBloc>().add(
                              CompetitionEvent.getSelectedCompetitions(
                                  index: index));
                          context.read<MatchBloc>().add(
                                MatchEvent.getMatch(
                                    competitionId: competition.id.toString()),
                              );
                          context.read<StandingBloc>().add(
                                StandingEvent.getStanding(
                                    competitionId: competition.id.toString()),
                              );
                          context.router.pushNamed('/detail');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.indigo.shade100),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(99),
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: SvgPicture.network(
                                    competition.area.ensignUrl ??
                                        'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
                                    fit: BoxFit.cover,
                                    placeholderBuilder: (context) =>
                                        const Center(
                                            child: CircularProgressIndicator()),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                competition.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              orElse: () {
                return Container();
              },
            );
          },
        ),
      ),
    );
  }
}
