class InfoCharacterDom {
  InfoCharacterDom({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String image;

  StatusCharacter get statusEnum {
    Map<String, dynamic> status = {
      'alive': StatusCharacter.alive,
      'dead': StatusCharacter.dead,
      'unknown': StatusCharacter.unknown,
    };
    return status[this.status.toLowerCase()] ?? StatusCharacter.unknown;
  }
}

enum StatusCharacter { alive, dead, unknown }
