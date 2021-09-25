import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WinnerScore extends StatelessWidget {
  final int awayTeam;
  final int homeTeam;
  const WinnerScore({Key? key, required this.awayTeam, required this.homeTeam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text('$homeTeam'),
            homeTeam > awayTeam
                ? const Icon(
                    Icons.arrow_back_ios_new,
                    size: 12,
                  )
                : Container(width: 12)
          ],
        ),
        Row(
          children: [
            Text('$awayTeam'),
            homeTeam < awayTeam
                ? const Icon(
                    Icons.arrow_back_ios_new,
                    size: 12,
                  )
                : Container(width: 12)
          ],
        ),
      ],
    );
  }
}
