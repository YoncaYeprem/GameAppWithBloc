import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app_with_bloc/core/constants/string_constants.dart';
import 'package:game_app_with_bloc/core/init/base/network_manager.dart';
import 'package:game_app_with_bloc/feature/game/model/game_model.dart';
import 'package:game_app_with_bloc/feature/game/service/game_service.dart';
import 'package:game_app_with_bloc/feature/game/viewmodel/bloc/game_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:auto_route/auto_route.dart';
import 'package:kartal/kartal.dart';
import '../../../core/init/router/router.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<GameBloc>(
        create: (context) =>
            GameBloc(gameService: GameService(NetworkManager.instance.dio)),
        child: SafeArea(
          child: BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              if (state is GameInitialState) {
                context.read<GameBloc>().add(LoadGameDataEvent());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GameLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GameDataLoadedState) {
                return buildGameModel(state.gameData);
              } else if (state is GameErrorState) {
                return Text(state.errorMessage ?? "");
              } else {
                return Text(StringConstants.error);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildGameModel(List<GameModel?>? gameDataList) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: gameDataList?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final GameModel? dataModel = gameDataList?[index];
        return Padding(
          padding: context.paddingLow,
          child: InkWell(
            onTap: () {
              context.router.push(GameDetailViewRoute(
                  dataModel: dataModel ?? const GameModel()));
            },
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      height: context.dynamicHeight(0.3),
                      fit: BoxFit.cover,
                      image: NetworkImage(dataModel?.image ?? ""),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: GlassmorphicContainer(
                      width: context.dynamicWidth(1),
                      height: context.dynamicHeight(0.12),
                      border: 0,
                      borderRadius: 0,
                      blur: 20,
                      alignment: Alignment.bottomCenter,
                      linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.1),
                          const Color(0xFFFFFFFF).withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1,
                        ],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: Padding(
                        padding: context.paddingLow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(dataModel?.title ?? "",
                                  style: context.textTheme.headline6),
                            ),
                            context.emptySizedHeightBoxLow,
                            Text(
                              StringConstants.platforms +
                                  (dataModel?.platforms ?? ""),
                              style: context.textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
