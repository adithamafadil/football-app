import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/inject/inject.dart';
import 'package:football_app/presentation/blocs/blocs.dart';
import 'package:football_app/presentation/router/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then(
    (value) => runApp(FootballApp()),
  );
}

class FootballApp extends StatelessWidget {
  FootballApp({Key? key}) : super(key: key);

  final _footBallRouter = FootballRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => inject<CompetitionBloc>()),
        BlocProvider(create: (context) => inject<MatchBloc>()),
        BlocProvider(create: (context) => inject<StandingBloc>()),
      ],
      child: MaterialApp.router(
        routeInformationParser: _footBallRouter.defaultRouteParser(),
        routerDelegate: _footBallRouter.delegate(),
        theme: ThemeData(
          tabBarTheme: TabBarTheme(
            indicator: BoxDecoration(color: Colors.indigo.shade300),
            unselectedLabelColor: Colors.grey,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
