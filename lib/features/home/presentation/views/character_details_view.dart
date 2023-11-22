import 'package:flutter/material.dart';
import '../widgets/character_details_view_body.dart';

class CharacterDetailsView extends StatefulWidget {
  const CharacterDetailsView({Key? key}) : super(key: key);

  @override
  State<CharacterDetailsView> createState() => _CharacterDetailsViewState();
}

class _CharacterDetailsViewState extends State<CharacterDetailsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewRoute =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var charactersModel = viewRoute['charactersModel'];

    return Scaffold(
      body: CharacterDetailsViewBody(charactersModel: charactersModel),
    );
  }
}
