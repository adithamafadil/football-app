import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_app/presentation/blocs/blocs.dart';
import 'package:football_app/presentation/widgets/soccer_loading.dart';

class StandingTab extends StatelessWidget {
  const StandingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StandingBloc, StandingState>(builder: (context, state) {
      return state.standingState.maybeWhen(
        loading: () {
          return const SoccerLoading();
        },
        success: () {
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.standingList.length,
            itemBuilder: (context, index) {
              var standing = state.standingList[index];
              List<DataRow> rows = [];
              for (var i = 0; i < standing.table.length; i++) {
                rows.add(DataRow(cells: [
                  DataCell(Text(standing.table[i].position.toString())),
                  DataCell(Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: (standing.table[i].team.crestUrl ?? '')
                                .contains('svg')
                            ? SvgPicture.network(
                                standing.table[i].team.crestUrl ??
                                    'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
                                fit: BoxFit.contain,
                                placeholderBuilder: (context) => const Center(
                                    child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                )),
                              )
                            : Image.network(
                                standing.table[i].team.crestUrl ??
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png',
                                fit: BoxFit.contain,
                              ),
                      ),
                      const SizedBox(width: 4),
                      Text(standing.table[i].team.name),
                    ],
                  )),
                  DataCell(Text(standing.table[i].points.toString())),
                  DataCell(Text(standing.table[i].playedGames.toString())),
                  DataCell(Text(standing.table[i].won.toString())),
                  DataCell(Text(standing.table[i].draw.toString())),
                  DataCell(Text(standing.table[i].lost.toString())),
                  DataCell(Text(standing.table[i].goalsFor.toString())),
                  DataCell(Text(standing.table[i].goalsAgainst.toString())),
                ]));
              }
              return Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    rows: rows,
                    columns: const [
                      DataColumn(label: Text('No')),
                      DataColumn(label: Text('Team Name')),
                      DataColumn(label: Text('Pt')),
                      DataColumn(label: Text('P')),
                      DataColumn(label: Text('W')),
                      DataColumn(label: Text('D')),
                      DataColumn(label: Text('L')),
                      DataColumn(label: Text('GF')),
                      DataColumn(label: Text('GA')),
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
    });
  }
}
