import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../feature/game/model/game_model.dart';
import '../../../feature/game/view/game_view.dart';
import '../../../feature/game_detail/view/game_detail_view.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: GameView, initial: true),
    AutoRoute(page: GameDetailView),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}