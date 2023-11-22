import 'package:better_call_saul_app/features/home/data/models/characters_quotes_model.dart';
import 'package:better_call_saul_app/features/home/data/repos/home_repo.dart';
import 'package:better_call_saul_app/features/home/presentation/view_models/home_cubit/home_states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/characters_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(InitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;
  List<CharactersModel> allCharacters = [];

  void getCharacters() async {
    emit(GetCharactersLoadingState());
    var data = await homeRepo.getCharacters();
    if (data.isNotEmpty) {
      allCharacters = data;
      emit(GetCharactersSuccessState(allCharacters: data));
    } else {
      emit(GetCharactersErrorState());
    }
  }

  bool isSearching = false;

  late List<CharactersModel> searchedCharacters;

  var textFieldSearchController = TextEditingController();

  void getAllCharacters(searchQuery) {
    searchedCharacters = allCharacters
        .where(
            (character) => character.name.toLowerCase().contains(searchQuery))
        .toList();
    // for (var character in searchedCharacters) {
    //   print(character.name);
    // }
    emit(GetSearchedCharactersState());
  }

  void onSearchIconClicked(context) {
    isSearching = true;

    //To Navigate
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    emit(ChangeAppBarState());
  }

  void _stopSearching() {
    _clearSearch();
    isSearching = false;
    emit(StopSearchState());
  }

  void _clearSearch() {
    textFieldSearchController.clear();
    emit(ClearSearchState());
  }

  List<CharactersQuotesModel> charactersQuotes = [];

  void getQuotes() async {
    emit(GetCharactersLoadingState());
    var data = await homeRepo.getQuotes();
    if (data.isNotEmpty) {
      charactersQuotes = data;
      emit(GetQuotesSuccessState(charactersQuotes: charactersQuotes));
    } else {
      emit(GetQuotesErrorState());
    }
  }

  List<String> allCharacterQuotes = [];

  void getCharacterQuotes(String characterName) {
    if (charactersQuotes.isNotEmpty) {
      allCharacterQuotes.clear();
      for (var character in charactersQuotes) {
        if (character.author == characterName) {
          allCharacterQuotes.add(character.quote);
          //print(character.quote);
        }
      }
      print(allCharacterQuotes.length);

      emit(GetQuotesForCharacterSuccessState());
    }
  }
}
