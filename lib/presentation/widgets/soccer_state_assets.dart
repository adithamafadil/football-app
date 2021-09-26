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

class SoccerError extends StatelessWidget {
  const SoccerError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 300,
            child: LottieBuilder.asset(
              'assets/something-went-wrong.json',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class SoccerLostConnection extends StatelessWidget {
  const SoccerLostConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
            child: LottieBuilder.asset(
              'assets/connection-lost.json',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          const Text('Connection Error!'),
        ],
      ),
    );
  }
}
