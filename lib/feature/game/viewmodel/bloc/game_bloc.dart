import 'package:bloc/bloc.dart';
import 'package:game_app_with_bloc/feature/game/model/game_model.dart';
import 'package:game_app_with_bloc/feature/game/service/igame_service.dart';
import 'package:meta/meta.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final IGameService gameService;
  
  GameBloc({required this.gameService}) : super(GameInitialState()) {
    on<GameEvent>((event, emit) async {
      if (event is LoadGameDataEvent) {
        emit(GameLoadingState());
        List<GameModel>? gameAllDatas = await gameService.getAllGames();
        if (gameAllDatas == null) {
          emit(GameErrorState(errorMessage: "Data Couldnt Loaded"));
        }else{
          emit(GameDataLoadedState(gameData: gameAllDatas ));
        }
      }
    });
  }
}
