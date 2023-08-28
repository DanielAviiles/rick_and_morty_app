// ignore_for_file: close_sinks

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'menu_structure_event.dart';
part 'menu_structure_state.dart';

class MenuStructureBloc extends Bloc<MenuStructureEvent, MenuStructureState> {
  MenuStructureBloc() : super(InitMenuStructureState());

  final BehaviorSubject<int> currentPage = BehaviorSubject<int>();
}
