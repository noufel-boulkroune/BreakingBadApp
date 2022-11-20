import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/api.dart';
import '../models/characters.dart';

class CharactersWebServices {
  Future<List<Characters>> getAllCharacters() async {
    try {
      var url = Uri.https(baseUrl);
      var response = await http.get(url);

      var charactersData = jsonDecode(response.body);
      return charactersData;
    } catch (error) {
      throw error;
    }
  }
}
