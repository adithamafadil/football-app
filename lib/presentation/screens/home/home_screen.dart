import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/presentation/blocs/blocs.dart';
import 'package:football_app/presentation/blocs/competition/competition_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<CompetitionBloc, CompetitionState>(
          builder: (context, state) {
            return state.competitionState.maybeWhen(
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              success: () {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                  ),
                  itemCount: state.competitionList.length,
                  itemBuilder: (context, index) {
                    var competition = state.competitionList[index];
                    return InkWell(
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                                height: 100,
                                width: 200,
                                child: SvgPicture.network(
                                  competition.area.ensignUrl ??
                                      'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
                                  fit: BoxFit.cover,
                                  placeholderBuilder: (context) => const Center(
                                      child: CircularProgressIndicator()),
                                )),
                            Text(competition.name),
                          ],
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
