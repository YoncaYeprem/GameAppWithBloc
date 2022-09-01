import 'package:game_app_with_bloc/feature/game/model/game_model.dart';
import 'package:game_app_with_bloc/feature/game/service/igame_service.dart';

class GameService extends IGameService {
  GameService(super.dio);

  @override
  Future<List<GameModel>?> getAllGames() async {
    final response = await dio.get("/giveaways");

    if (response.statusCode == 200) {
      try {
        final data = response.data;
        if (data is List) {
          return data.map((e) => GameModel.fromJson(e)).toList();
        }
      } catch (e) {
        print(e);
      }
    }else{
      return null;
    }
  }
}
