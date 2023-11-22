import 'package:better_call_saul_app/features/home/data/models/characters_model.dart';
import '../models/characters_quotes_model.dart';

abstract class HomeRepo {
  Future<List<CharactersModel>> getCharacters();

  Future<List<CharactersQuotesModel>> getQuotes();
}
