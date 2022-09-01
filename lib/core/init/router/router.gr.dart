// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    GameViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const GameView());
    },
    GameDetailViewRoute.name: (routeData) {
      final args = routeData.argsAs<GameDetailViewRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: GameDetailView(key: args.key, dataModel: args.dataModel));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(GameViewRoute.name, path: '/'),
        RouteConfig(GameDetailViewRoute.name, path: '/game-detail-view')
      ];
}

/// generated route for
/// [GameView]
class GameViewRoute extends PageRouteInfo<void> {
  const GameViewRoute() : super(GameViewRoute.name, path: '/');

  static const String name = 'GameViewRoute';
}

/// generated route for
/// [GameDetailView]
class GameDetailViewRoute extends PageRouteInfo<GameDetailViewRouteArgs> {
  GameDetailViewRoute({Key? key, required GameModel dataModel})
      : super(GameDetailViewRoute.name,
            path: '/game-detail-view',
            args: GameDetailViewRouteArgs(key: key, dataModel: dataModel));

  static const String name = 'GameDetailViewRoute';
}

class GameDetailViewRouteArgs {
  const GameDetailViewRouteArgs({this.key, required this.dataModel});

  final Key? key;

  final GameModel dataModel;

  @override
  String toString() {
    return 'GameDetailViewRouteArgs{key: $key, dataModel: $dataModel}';
  }
}
