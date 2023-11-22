import 'package:flutter/material.dart';
import '../../data/models/characters_model.dart';
import '../view_models/home_cubit/home_cubit.dart';
import 'characters_grid_view_item.dart';

class CharactersGridView extends StatelessWidget {
  const CharactersGridView({super.key, required this.charactersModel});

  final List<CharactersModel> charactersModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width * .5,
        childAspectRatio: 1.9 / 3.0,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) => CharactersGridViewItem(
        charactersModel:
            HomeCubit.get(context).textFieldSearchController.text.isEmpty
                ? charactersModel[index]
                : HomeCubit.get(context).searchedCharacters[index],
      ),
      itemCount: HomeCubit.get(context).textFieldSearchController.text.isEmpty
          ? charactersModel.length
          : HomeCubit.get(context).searchedCharacters.length,
    );
  }
}
