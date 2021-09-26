import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SoccerLoading extends StatelessWidget {
  const SoccerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100,
            child: LottieBuilder.asset(
              'assets/loading.json',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          const Text('Loading...'),
        ],
      ),
    );
  }
}
