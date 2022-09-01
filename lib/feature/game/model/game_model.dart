import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'game_model.freezed.dart';
part 'game_model.g.dart';

@freezed
class GameModel with _$GameModel {
  const factory GameModel({
    int? id,
    String? title,
    String? worth,
    String? thumbnail,
    String? image,
    String? description,
    String? instructions,
    String? openGiveawayUrl,
    String? publishedDate,
    String? type,
    String? platforms,
    String? endDate,
    int? users,
    String? status,
    String? gamerpowerUrl,
    String? openGiveaway,
  }) = _GameModel;

  factory GameModel.fromJson(Map<String, Object?> json) =>
      _$GameModelFromJson(json);
}
