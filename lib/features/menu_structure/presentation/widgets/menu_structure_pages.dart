import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/entities/navigation_item_entity.dart';
import 'package:rick_and_morty_app/features/home/presentation/screens/empty_screen.dart';

const burnedMessage = 'No implemented view';

class MenuStructurePages {
  static const  List<NavigationItemEntity> pages = [
    NavigationItemEntity(
      name: 'Personajes',
      widget: EmptyScreen(message: burnedMessage + ' Personajes'),
      icon: Icons.abc_outlined,
    ),
    NavigationItemEntity(
      name: 'Ubicaciones',
      widget: EmptyScreen(message: burnedMessage + ' Ubicaciones'),
      icon: Icons.ac_unit_sharp,
    ),
    NavigationItemEntity(
      name: 'Episodios',
      widget: EmptyScreen(message: burnedMessage + ' Episodios'),
      icon: Icons.access_alarms,
    ),
  ];
}