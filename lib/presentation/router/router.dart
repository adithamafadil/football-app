import 'package:auto_route/auto_route.dart';
import 'package:football_app/presentation/screens/screens.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(
      name: 'HomeScreenRoute',
      path: '/',
      page: HomeScreen,
    ),
    AutoRoute(
      name: 'DetailScreenRoute',
      path: '/detail',
      page: DetailScreen,
    ),
  ],
)
class $FootballRouter {}
