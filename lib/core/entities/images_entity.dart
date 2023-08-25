import 'package:rick_and_morty_app/core/entities/serealizable_entity.dart';
import 'package:rick_and_morty_app/core/models/images/images_model.dart';

class ImagesEntity with SerealizableResponseEntity<ImagesEntity> {
  ImagesEntity({
    required this.id,
    required this.name,
    required this.path,
  });
  final int id;
  final String name;
  final String path;

  @override
  ImagesEntity fromJson(Map<String, dynamic> json) =>
      ImagesModel.fromJson(json);

  ImagesModel toModel() => ImagesModel(id: id, name: name, path: path);

  static const String table = 'images';

  @override
  String get tableName => 'images';

  @override
  Map<String, dynamic> toJson() => toModel().toJson();
}
