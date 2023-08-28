import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/entities/navigation_item_entity.dart';
import 'package:rick_and_morty_app/features/menu_structure/presentation/bloc/menu_structure_bloc.dart';
import 'package:rick_and_morty_app/features/menu_structure/presentation/screens/menu_structure_screen.dart';
import 'package:rick_and_morty_app/features/menu_structure/presentation/widgets/menu_structure_pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final List<NavigationItemEntity> pages = MenuStructurePages.pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: StreamBuilder<int>(
          stream: context.read<MenuStructureBloc>().currentPage.stream,
          builder: (_, snapshot) {
            return IndexedStack(
              index: snapshot.data ?? 0,
              children:
                  List.generate(pages.length, (index) => pages[index].widget),
            );
          },
        ),
      ),
      bottomNavigationBar: MenuStructureScreen(),
    );
  }
}
