import 'package:rick_and_morty_app/app/core/usecase/usecase.dart';

abstract class Command<Type, Params> extends UseCase<Type, Params> {
  bool readonly = false;
}
