import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/app/core/bloc/generic_field_bloc.dart';
import 'package:rick_and_morty_app/app/core/errors/failure.dart';
import 'package:rick_and_morty_app/app/core/usecase/query.dart';
import 'package:rick_and_morty_app/app/modules/home/application/querys/get_characters_usecase.dart';
import 'package:rick_and_morty_app/app/modules/home/application/querys/get_info_episodes_usecase.dart';
import 'package:rick_and_morty_app/app/modules/home/application/querys/get_name_location_usecase.dart';
import 'package:rick_and_morty_app/app/modules/home/domain/models/info_character_dom.dart';
import 'package:rick_and_morty_app/app/modules/home/ui/bloc/home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc({
    required this.getCharactersUseCase,
    required this.getNumberEpisodesUseCase,
    required this.getLocationNameUseCase,
  }) : super(HomeState.init()) {
    init();
  }

  final GetCharactersUseCase getCharactersUseCase;
  final GetNumberEpisodesUseCase getNumberEpisodesUseCase;
  final GetLocationNameUseCase getLocationNameUseCase;

  int page = 1;
  GenericFieldBloc<List<InfoCharacterDom>> listDom =
      GenericFieldBloc<List<InfoCharacterDom>>(
          defaultValue: <InfoCharacterDom>[]);
  ValueNotifier<bool> loadingScroll = ValueNotifier<bool>(false);
  int numberEpisodes = 0;
  String nameLocation = '';

  // =================================================================
  Future<void> init() async {
    emit(HomeState.loading());
    page = 1;
    listDom.sink([]);
    final data = await executeGetCharacters();
    listDom.sink(data);
    numberEpisodes = await executeGetNumberEpisodes();
    nameLocation = await executeGetNameLocationWithMoreCharacters();
    if (state is! HomeErrorState) emit(HomeState.success());
  }

  void emitState(HomeState state) => emit(state);

  void scrollControllerListener(ScrollController scrollController) async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      await infiniteScrollCharacters();
    }
  }

  Future<List<InfoCharacterDom>> executeGetCharacters() async {
    List<InfoCharacterDom> listCharacters = <InfoCharacterDom>[];
    final response = await getCharactersUseCase.execute(page);
    response?.fold(
      (Failure left) => emit(HomeState.error(controlError: left)),
      (List<InfoCharacterDom> value) {
        listCharacters.addAll(value);
      },
    );
    return listCharacters;
  }

  Future<int> executeGetNumberEpisodes() async {
    int episodes = 0;
    final response = await getNumberEpisodesUseCase.execute(NoParams());
    response?.fold(
      (Failure left) => emit(HomeState.error(controlError: left)),
      (int number) => episodes = number,
    );
    return episodes;
  }

  Future<String> executeGetNameLocationWithMoreCharacters() async {
    String name = '';
    final response = await getLocationNameUseCase.execute(NoParams());
    response?.fold(
      (Failure left) => emit(HomeState.error(controlError: left)),
      (String value) => name = value,
    );
    return name;
  }

  Future<void> infiniteScrollCharacters() async {
    page += 1;
    loadingScroll.value = true;
    final loadElements = await executeGetCharacters();
    loadingScroll.value = false;
    listDom.value!.addAll(loadElements);
    listDom.sink(listDom.value);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
