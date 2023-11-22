import 'package:flutter/material.dart';
import '../../../../core/utils/constants/My_Colors.dart';
import '../../../../core/utils/styles.dart';
import '../../data/models/characters_model.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.charactersModel,
  });

  final CharactersModel charactersModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.7,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          charactersModel.nickname,
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        titlePadding: const EdgeInsets.only(left: 50, bottom: 20),
        background: Hero(
          tag: charactersModel.characterId,
          child: Image.network(
            charactersModel.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
