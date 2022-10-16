import 'package:json_annotation/json_annotation.dart';
part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    this.episode,
    this.location,
  });

  @JsonKey()
  final int id;

  @JsonKey()
  final String name;

  @JsonKey()
  final String image;

  @JsonKey()
  final String status;

  @JsonKey()
  final String species;

  @JsonKey()
  final String? gender;

  @JsonKey()
  final List<String>? episode;

  @JsonKey()
  final Map<String, dynamic>? location;

  CharacterModel copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? gender,
    String? image,
    List<String>? episode,
    Map<String, dynamic>? location,
  }) =>
      CharacterModel(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        species: species ?? this.species,
        image: image ?? this.image,
        status: status ?? this.status,
        episode: episode ?? this.episode,
        location: location ?? this.location,
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
