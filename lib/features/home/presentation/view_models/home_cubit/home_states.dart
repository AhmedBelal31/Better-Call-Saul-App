import 'package:better_call_saul_app/features/home/data/models/characters_model.dart';
import 'package:better_call_saul_app/features/home/data/models/characters_quotes_model.dart';

abstract class HomeStates {}

class InitialState extends HomeStates {}

//States For Fetch All Characters Data
class GetCharactersLoadingState extends HomeStates {}

class GetCharactersSuccessState extends HomeStates {
  final List<CharactersModel> allCharacters;

  GetCharactersSuccessState({required this.allCharacters});
}

class GetCharactersErrorState extends HomeStates {
  // final String error ;
  // GetCharactersErrorState({required this.error});
  GetCharactersErrorState();
}

//States For Search
class GetSearchedCharactersState extends HomeStates {}

class ChangeAppBarState extends HomeStates {}

class StopSearchState extends HomeStates {}

class ClearSearchState extends HomeStates {}

//States For Quotes

class GetQuotesLoadingState extends HomeStates {}

class GetQuotesSuccessState extends HomeStates {
  final List<CharactersQuotesModel> charactersQuotes;

  GetQuotesSuccessState({required this.charactersQuotes});
}

class GetQuotesErrorState extends HomeStates {
  // final String error ;
  // GetCharactersErrorState({required this.error});
  GetQuotesErrorState();
}

class GetQuotesForCharacterSuccessState extends HomeStates {}
