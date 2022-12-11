import 'package:breaking_bad/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/constants/app_colors.dart';
import 'package:breaking_bad/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Characters>? allCharacters;
  @override
  void initState() {
    allCharacters = BlocProvider.of<CharactersCubit>(context).getAllCharacters()
        as List<Characters>;
    super.initState();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).charactersData as List<Characters>;
          return buildLoadedListWidget();
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.myYellow,
            ),
          );
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.myGrey,
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      itemBuilder: (context, index) {
        return CharacterItem();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myYellow,
        title: const Text(
          "Characters",
          style: TextStyle(color: AppColors.myGrey),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
