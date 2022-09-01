import 'package:dio/dio.dart';
import 'package:game_app_with_bloc/feature/game/model/game_model.dart';

abstract class IGameService {
  final Dio dio;

  IGameService(this.dio);

  Future<List<GameModel>?> getAllGames();
  
}