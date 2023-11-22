import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/constants/My_Colors.dart';
import '../../../../core/utils/styles.dart';
import '../../data/models/characters_model.dart';
import '../view_models/home_cubit/home_cubit.dart';

class AllCharactersInformation extends StatefulWidget {
  const AllCharactersInformation({
    super.key,
    required this.charactersModel,
  });

  final CharactersModel charactersModel;

  @override
  State<AllCharactersInformation> createState() =>
      _AllCharactersInformationState();
}

class _AllCharactersInformationState extends State<AllCharactersInformation> {
  @override
  void initState() {
    HomeCubit.get(context).getCharacterQuotes(widget.charactersModel.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomIndex = HomeCubit.get(context).allCharacterQuotes.isNotEmpty
        ? random.nextInt(HomeCubit.get(context).allCharacterQuotes.length - 1)
        : 0;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CharacterInformation(
                      title: 'Job',
                      value: widget.charactersModel.jobs.join(' / '),
                    ),
                  ],
                ),
                CharacterInformation(
                  title: 'Birthday',
                  value: widget.charactersModel.birthday,
                ),
                // myDivider(endIndent: 300),
                CharacterInformation(
                  title: 'Seasons',
                  value: widget.charactersModel.appearancePerSeason.join(' / '),
                ),
                //myDivider(endIndent: 300),
                CharacterInformation(
                  title: 'Status',
                  value: widget.charactersModel.status,
                ),
                //myDivider(endIndent: 240),
                CharacterInformation(
                  title: 'Actor/Actress',
                  value: widget.charactersModel.actorName,
                ),
                //myDivider(endIndent: 250),
                const SizedBox(height: 30),
                if (HomeCubit.get(context).allCharacterQuotes.isNotEmpty)
                  CustomAnimatedText(randomIndex: randomIndex),
                SizedBox(height: MediaQuery.of(context).size.height * 0.50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAnimatedText extends StatelessWidget {
  const CustomAnimatedText({
    super.key,
    required this.randomIndex,
  });

  final int randomIndex;

  @override
  Widget build(BuildContext context) {
    // return Text(
    //   '${HomeCubit.get(context).allCharacterQuotes[randomIndex]} ',
    //   style: Styles.textStyle18,
    // );
    return SizedBox(
      width: double.infinity,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          letterSpacing: 2,
          height: 1.5,
          shadows: [
            Shadow(
              blurRadius: 4.0,
              color: MyColors.myYellow,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            FlickerAnimatedText(
              HomeCubit.get(context).allCharacterQuotes[randomIndex],
              speed: const Duration(seconds: 5),
            ),
          ],
          onTap: () {},
        ),
      ),
    );
  }
}

class CharacterInformation extends StatelessWidget {
  const CharacterInformation(
      {Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Text(
                '$title : ',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 35),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 2,
                  // width: 20,
                  color: MyColors.myYellow,
                ),
              ),
            ],
          ),
          Expanded(
            child: Text(
              value,
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
