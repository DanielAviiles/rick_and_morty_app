import 'package:json_annotation/json_annotation.dart';
part 'comic_model.g.dart';

@JsonSerializable()
class ComicModel {
  ComicModel({
    required this.id,
    required this.titleComic,
    this.dateModified,
    this.descriptionComic,
    required this.thumbnail,
  });

  @JsonKey()
  final int id;

  @JsonKey(name: 'title')
  final String titleComic;

  @JsonKey(name: 'description')
  final String? descriptionComic;

  @JsonKey(name: 'modified')
  final DateTime? dateModified;

  @JsonKey()
  final Map<String, dynamic> thumbnail;

  String get urlImg =>
      '${this.thumbnail["path"]}.${this.thumbnail["extension"]}';

  ComicModel copyWith({
    int? id,
    String? titleComic,
    DateTime? dateModified,
    String? descriptionComic,
    Map<String, dynamic>? thumbnail,
  }) =>
      ComicModel(
        id: id ?? this.id,
        titleComic: titleComic ?? this.titleComic,
        dateModified: dateModified ?? this.dateModified,
        descriptionComic: descriptionComic ?? this.descriptionComic,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  static List<ComicModel> listFromJson(List<dynamic> list) {
    final List<ComicModel> listModels = list
        .map((dynamic e) => ComicModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return listModels;
  }

  factory ComicModel.fromJson(Map<String, dynamic> json) =>
      _$ComicModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComicModelToJson(this);
}
