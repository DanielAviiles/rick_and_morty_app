part of 'menu_structure_bloc.dart';

abstract class MenuStructureState {
  const MenuStructureState();
}

// Menu States /// -----------------------------------/// ------------
class InitMenuStructureState extends MenuStructureState {}

class LoadingMenuStructureState extends MenuStructureState {}

class FailedMenuStructureState extends MenuStructureState {}

class SuccessMenuStructureState extends MenuStructureState {}
