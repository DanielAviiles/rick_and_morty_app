import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/entities/navigation_item_entity.dart';
import 'package:rick_and_morty_app/core/theme/color.dart';
import 'package:rick_and_morty_app/features/menu_structure/presentation/bloc/menu_structure_bloc.dart';
import 'package:rick_and_morty_app/features/menu_structure/presentation/widgets/menu_structure_pages.dart';

class MenuStructureScreen extends StatefulWidget {
  const MenuStructureScreen({Key? key}) : super(key: key);

  @override
  State<MenuStructureScreen> createState() => _MenuStructureScreenState();
}

class _MenuStructureScreenState extends State<MenuStructureScreen> {
  late MenuStructureBloc _menuBloc;
  final List<NavigationItemEntity> pages = MenuStructurePages.pages;

  @override
  void initState() {
    _menuBloc = context.read<MenuStructureBloc>();
    _menuBloc.currentPage.sink.add(0);
    super.initState();
  }

  @override
  void dispose() {
    _menuBloc.currentPage.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _menuBloc.currentPage.stream,
      builder: (context, snapshot) {
        return AnimatedBottomNavigationBar(
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          backgroundColor: mainObscureTabNavigation,
          icons: pages.map((e) => e.icon).toList(),
          gapLocation: GapLocation.none,
          activeIndex: snapshot.data ?? 0,
          activeColor: mainYellow,
          inactiveColor: mainWhite,
          onTap: (idx) => _menuBloc.currentPage.add(idx),
        );
      },
    );
  }
}
