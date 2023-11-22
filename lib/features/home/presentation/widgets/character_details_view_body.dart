import 'package:better_call_saul_app/features/home/data/models/characters_model.dart';
import 'package:flutter/material.dart';
import 'all_characters_information.dart';
import 'custom_app_bar.dart';

class CharacterDetailsViewBody extends StatelessWidget {
  const CharacterDetailsViewBody({super.key, required this.charactersModel});

  final CharactersModel charactersModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(charactersModel: charactersModel),
        AllCharactersInformation(charactersModel: charactersModel),
      ],
    );
  }
}
