import 'package:flutter/material.dart';
import 'package:game_app_with_bloc/feature/game/model/game_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kartal/kartal.dart';
import '../../../core/constants/string_constants.dart';

class GameDetailView extends StatelessWidget {
  const GameDetailView({super.key, required this.dataModel});
  final GameModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                height: context.dynamicHeight(0.3),
                width: context.dynamicWidth(1),
                fit: BoxFit.cover,
                image: NetworkImage(dataModel.image ?? ""),
              ),
              Padding(
                padding: context.horizontalPaddingLow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    context.emptySizedHeightBoxLow3x,
                    Text(dataModel.title ?? "",
                        style: context.textTheme.headline4
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    if (dataModel.worth != StringConstants.nan)
                      context.emptySizedHeightBoxLow,
                    if (dataModel.worth != StringConstants.nan)
                      Container(
                        padding: context.paddingLow,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(dataModel.worth ?? "",
                            style: context.textTheme.headline6),
                      ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                        StringConstants.avaliable + (dataModel.platforms ?? ""),
                        style: context.textTheme.bodyText1),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(StringConstants.desc,
                        style: context.textTheme.headline5
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    Text(
                      dataModel.description ?? "",
                    ),
                    context.emptySizedHeightBoxLow3x,
                    Text(StringConstants.steps,
                        style: context.textTheme.headline5
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    context.emptySizedHeightBoxLow,
                    Text(
                      dataModel.instructions ?? "",
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
