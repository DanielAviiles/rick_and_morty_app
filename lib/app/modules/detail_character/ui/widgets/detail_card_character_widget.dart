import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/modules/detail_character/domain/models/detail_character_dom.dart';

class DetailCardCharacter extends StatelessWidget {
  const DetailCardCharacter({Key? key, required this.character})
      : super(key: key);

  final DetailCharacterDom character;

  @override
  Widget build(BuildContext context) {
    final double radius = 8;
    return Container(
      height: MediaQuery.of(context).size.height * .54,
      padding: EdgeInsets.symmetric(horizontal: 30).copyWith(top: 20),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        elevation: 30,
        shadowColor: Colors.grey.shade400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'Detalle',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                child: Image.network(
                  character.image,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width * .6,
                  height: 220,
                  errorBuilder: (ctx, error, _) =>
                      Icon(Icons.image_not_supported_sharp),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8).copyWith(right: 4),
              child: Center(
                child: Text(
                  character.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            textCard('Genero: \t${character.gender}'),
            textCard('Origen: \t${character.origin}'),
            textCard('Ubicacion: \t${character.location}'),
            textCard('Numero de episodios: \t${character.numberEpisodes}'),
          ],
        ),
      ),
    );
  }

  Widget textCard(String value) => Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(value,
          overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16)));
}
