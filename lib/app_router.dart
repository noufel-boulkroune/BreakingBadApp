// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_bad/business_logic/cubit/characters_cubit.dart';
import 'package:flutter/material.dart';

import 'package:breaking_bad/data/repository/characters_repository.dart';
import 'package:breaking_bad/data/web_services/characters_web_services.dart';
import 'package:breaking_bad/presentation/screens/characters_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/characters_details_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  AppRouter() {
    charactersRepository =
        CharactersRepository(charactersWebServices: CharactersWebServices());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "charactersScreen":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                CharactersCubit(charactersRepository: charactersRepository),
            child: const CharactersScreen(),
          ),
        );
      case "characterDetailsScreen":
        return MaterialPageRoute(
          builder: (context) => const CharactersDetailsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const CharactersScreen(),
        );
    }
  }
}
