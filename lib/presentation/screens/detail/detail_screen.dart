import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/presentation/blocs/blocs.dart';
import 'package:football_app/presentation/widgets/match_tab.dart';
import 'package:football_app/presentation/widgets/standing_tab.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  final List<Widget> tabBarChildren = const [
    StandingTab(),
    MatchTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBarChildren.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.select((CompetitionBloc bloc) =>
                  bloc.state.selectedCompetition?.name) ??
              'Unknown League'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Standings'),
            Tab(text: 'Matches'),
          ]),
        ),
        body: TabBarView(children: tabBarChildren),
      ),
    );
  }
}
