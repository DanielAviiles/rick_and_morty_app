import 'package:rick_and_morty_app/app/core/usecase/usecase.dart';

abstract class Query<Type, Params> extends UseCase<Type, Params> {
  bool readonly = true;
}

class NoParams {
  List<Object> get props => [];
}
