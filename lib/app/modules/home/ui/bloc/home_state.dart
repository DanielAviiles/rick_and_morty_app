class HomeState {
  HomeState();
  factory HomeState.init() => HomeInitState();
  factory HomeState.loading() => HomeLoadingState();
  factory HomeState.success() => HomeSuccessState();
  factory HomeState.error() => HomeErrorState();
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
  HomeErrorState() : super();
}