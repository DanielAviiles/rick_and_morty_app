import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/modules/home/domain/models/info_character_dom.dart';
import 'package:rick_and_morty_app/app/routes/app_routes.dart';

class CardHeroWidget extends StatelessWidget {
  const CardHeroWidget({Key? key, required this.character}) : super(key: key);

  final InfoCharacterDom character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            dense: true,
            leading: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              child: Image.network(
                character.image,
                fit: BoxFit.fill,
                errorBuilder: (ctx, error, _) =>
                    Icon(Icons.image_not_supported_sharp),
              ),
            ),
            title: Text(character.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 15,
                        child: CircleAvatar(
                            backgroundColor:
                                colorStatus(character.statusEnum))),
                    Text(character.status,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal)),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(character.species, style: TextStyle(fontSize: 14)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 8),
                      decoration: BoxDecoration(
                          color: Colors.limeAccent,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text('Detalle',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.detail_character,
                  arguments: character.id);
            },
          ),
        ),
      ),
    );
  }

  Color colorStatus(StatusCharacter status) {
    Color statusColor;
    switch (status) {
      case StatusCharacter.alive:
        statusColor = Colors.green;
        break;
      case StatusCharacter.dead:
        statusColor = Colors.red;
        break;
      case StatusCharacter.unknown:
        statusColor = Colors.grey.shade300;
        break;
      default:
        statusColor = Colors.grey.shade300;
        break;
    }
    return statusColor;
  }
}
