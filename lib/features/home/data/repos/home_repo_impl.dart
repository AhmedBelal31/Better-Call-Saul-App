import 'package:better_call_saul_app/core/utils/api_service.dart';
import 'package:better_call_saul_app/features/home/data/models/characters_model.dart';
import 'package:better_call_saul_app/features/home/data/models/characters_quotes_model.dart';
import 'package:better_call_saul_app/features/home/data/repos/home_repo.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/utils/constants/Strings.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<List<CharactersModel>> getCharacters() async {
    try {
      var response = await apiService.getData(endPoint: charactersEndPoint);
      List<CharactersModel> allCharacters = [];
      for (var character in response.data) {
        if (character['char_id'] == 3) {
          character['img'] = characterThreeImage;
          allCharacters.add(CharactersModel.fromJson(character));
        } else {
          allCharacters.add(CharactersModel.fromJson(character));
        }
      }
      return allCharacters;
    } catch (error) {
      debugPrint(error.toString());
      return [];
    }
  }

  @override
  Future<List<CharactersQuotesModel>> getQuotes() async {
    List<CharactersQuotesModel> charactersQuotes = [];
    try {
      var result = await apiService.getData(endPoint: quotesEndPoint);
      for (var quote in result.data) {
        charactersQuotes.add(CharactersQuotesModel.fromJson(quote));
      }
      //debugPrint(charactersQuotes);
      return charactersQuotes;
    } catch (error) {
      debugPrint(error.toString());
      return [];
    }
  }
}
