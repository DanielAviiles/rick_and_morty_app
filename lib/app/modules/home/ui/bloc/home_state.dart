import 'package:rick_and_morty_app/app/core/errors/failure.dart';

class HomeState {
  HomeState({this.controlError});

  final Failure? controlError;

  factory HomeState.init() => HomeInitState();
  factory HomeState.loading() => HomeLoadingState();
  factory HomeState.success() => HomeSuccessState();
  factory HomeState.error({Failure? controlError}) =>
      HomeErrorState(controlError: controlError);
}

class HomeInitState extends HomeState {
  HomeInitState() : super();
}

class HomeLoadingState extends HomeState {
  HomeLoadingState() : super();
}

class HomeSuccessState extends HomeState {
  HomeSuccessState() : super();
}

class HomeErrorState extends HomeState {
  HomeErrorState({this.controlError}) : super(controlError: controlError);
  final Failure? controlError;
}
