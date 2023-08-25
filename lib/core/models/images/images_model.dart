import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/core/entities/images_entity.dart';

part 'images_model.g.dart';

@JsonSerializable()
class ImagesModel extends ImagesEntity {
  ImagesModel({required super.id, required super.name, required super.path});

  factory ImagesModel.fromJson(Map<String, dynamic> json) =>
      _$ImagesModelFromJson(json);

  static List<ImagesModel> listFromJson(List<dynamic> list) =>
      list.map((e) => ImagesModel.fromJson(e)).toList();

  static List<Map<String, dynamic>> listToJson(List<ImagesEntity> list) =>
      list.map((e) => e.toJson()).toList();

  @override
  Map<String, dynamic> toJson() => _$ImagesModelToJson(this);
}
