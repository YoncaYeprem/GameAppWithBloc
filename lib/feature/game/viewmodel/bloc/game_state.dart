part of 'game_bloc.dart';

@immutable
abstract class GameState {}

class GameInitialState extends GameState {}

class GameLoadingState extends GameState {}

class GameDataLoadedState extends GameState {
  final List<GameModel?> gameData;

  GameDataLoadedState({required this.gameData});
}

class GameErrorState extends GameState {
  final String? errorMessage;

  GameErrorState({required this.errorMessage});
}
