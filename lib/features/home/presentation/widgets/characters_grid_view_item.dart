import 'package:better_call_saul_app/core/utils/app_router.dart';
import 'package:better_call_saul_app/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../data/models/characters_model.dart';

class CharactersGridViewItem extends StatelessWidget {
  const CharactersGridViewItem({super.key, required this.charactersModel});

  final CharactersModel charactersModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.characterDetailsView,
            arguments: {
              'charactersModel': charactersModel,
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            border: Border.all(
              color: Colors.white.withOpacity(.7),
              width: 3,
            ),
          ),
          child: GridTile(
            footer: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Text(
                charactersModel.name,
                style: Styles.textStyle16,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              // child: FadeInImage.assetNetwork(
              //   placeholder: 'assets/images/loading.gif',
              //   image: charactersModel.image != ''
              //       ? charactersModel.image
              //       : 'assets/images/loading.gif',
              //   fit: BoxFit.cover,
              // ),
              child: Hero(
                tag: charactersModel.characterId,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: charactersModel.image != ''
                      ? charactersModel.image
                      : 'assets/images/loading.gif',
                  placeholder: (context, url) =>
                      Lottie.asset('assets/images/yellowloading.json'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
