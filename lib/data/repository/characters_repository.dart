import '../web_services/characters_web_services.dart';

import '../models/characters.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;
  CharactersRepository({required this.charactersWebServices});

  Future<List<Characters>> fetchAndSetAllCharacters() async {
    final charactersData = await charactersWebServices.getAllCharacters();
    return charactersData
        .map((character) =>
            Characters.fromJson(character as Map<String, dynamic>))
        .toList();
  }
}
