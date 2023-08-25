import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/app/core/bloc/generic_field_bloc.dart';
import 'package:rick_and_morty_app/app/core/errors/failure.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/application/querys/get_character_usecase.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/domain/models/detail_character_dom.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/ui/bloc/detail_character_state.dart';

class DetailCharacterBloc extends Cubit<DetailCharacterState> {
  DetailCharacterBloc({required this.getCharacterUseCase})
      : super(DetailCharacterState.init());

  final GetCharacterUseCase getCharacterUseCase;

  GenericFieldBloc<DetailCharacterDom> characterDom =
      GenericFieldBloc<DetailCharacterDom>();
  ValueNotifier<bool> loadingScroll = ValueNotifier<bool>(false);

  // =================================================================

  void emitState(DetailCharacterState state) => emit(state);

  Future<void> didChangeDependencies(int id) async {
    emitState(DetailCharacterState.loading());
    final info = await executeGetCharacterById(id);
    characterDom.sink(info);
    emitState(DetailCharacterState.success(character: characterDom.value));
  }

  Future<DetailCharacterDom?> executeGetCharacterById(int id) async {
    DetailCharacterDom? character;
    final response = await getCharacterUseCase.execute(id);
    response?.fold(
      (Failure left) => emit(DetailCharacterState.error(controlError: left)),
      (DetailCharacterDom value) {
        character = value;
      },
    );
    return character;
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
