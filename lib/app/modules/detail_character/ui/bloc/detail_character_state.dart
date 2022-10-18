import 'package:rick_and_morty_app/app/core/errors/failure.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/domain/models/detail_character_dom.dart';

class DetailCharacterState {
  DetailCharacterState({this.controlError, this.character});

  final Failure? controlError;
  final DetailCharacterDom? character;

  factory DetailCharacterState.init() => DetailCharacterInitState();
  factory DetailCharacterState.loading() => DetailCharacterLoadingState();
  factory DetailCharacterState.success({DetailCharacterDom? character}) =>
      DetailCharacterSuccessState(character: character);
  factory DetailCharacterState.error({Failure? controlError}) =>
      DetailCharacterErrorState(controlError: controlError);
}

class DetailCharacterInitState extends DetailCharacterState {
  DetailCharacterInitState() : super();
}

class DetailCharacterLoadingState extends DetailCharacterState {
  DetailCharacterLoadingState() : super();
}

class DetailCharacterSuccessState extends DetailCharacterState {
  DetailCharacterSuccessState({this.character}) : super(character: character);
  final DetailCharacterDom? character;
}

class DetailCharacterErrorState extends DetailCharacterState {
  DetailCharacterErrorState({this.controlError})
      : super(controlError: controlError);
  final Failure? controlError;
}
