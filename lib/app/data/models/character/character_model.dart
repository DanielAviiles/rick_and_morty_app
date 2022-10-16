import 'package:json_annotation/json_annotation.dart';
part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  CharacterModel({
    required this.id,
    required this.nameHero,
    this.descriptionHero,
    this.dateModified,
    this.collectionComics,
    required this.thumbnail,
  });

  @JsonKey()
  final int id;

  @JsonKey(name: 'name')
  final String nameHero;

  @JsonKey(name: 'description')
  final String? descriptionHero;

  @JsonKey()
  final Map<String, dynamic> thumbnail;

  @JsonKey(name: 'modified')
  final DateTime? dateModified;

  @JsonKey(name: 'comics')
  final Map<String, dynamic>? collectionComics;

  String get urlImg =>
      '${this.thumbnail["path"]}.${this.thumbnail["extension"]}';
  
  String get urlReleatedComics => '${collectionComics?["collectionURI"]}';

  CharacterModel copyWith({
    int? id,
    String? nameHero,
    String? descriptionHero,
    DateTime? dateModified,
    Map<String, dynamic>? collectionComics,
    Map<String, dynamic>? thumbnail,
  }) =>
      CharacterModel(
        id: id ?? this.id,
        nameHero: nameHero ?? this.nameHero,
        descriptionHero: descriptionHero ?? this.descriptionHero,
        dateModified: dateModified ?? this.dateModified,
        collectionComics: collectionComics ?? this.collectionComics,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  static List<CharacterModel> listFromJson(List<dynamic> list) {
    final List<CharacterModel> listModels = list
        .map((dynamic e) => CharacterModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return listModels;
  }

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
