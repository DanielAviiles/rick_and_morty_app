// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      gender: json['gender'] as String?,
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>?)?.map((e) => e as String).toList(),
      location: json['location'] as Map<String, dynamic>?,
      origin: json['origin'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'status': instance.status,
      'species': instance.species,
      'gender': instance.gender,
      'episode': instance.episode,
      'location': instance.location,
      'origin': instance.origin,
    };
