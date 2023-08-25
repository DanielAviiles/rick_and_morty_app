import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  LocationModel({
    required this.id,
    required this.name,
    required this.residents,
    this.dimension,
    this.type,
  });

  @JsonKey()
  final int id;

  @JsonKey()
  final String name;

  @JsonKey()
  final String? type;

  @JsonKey()
  final String? dimension;

  @JsonKey()
  final List<String> residents;

  LocationModel copyWith({
    int? id,
    String? name,
    String? type,
    String? dimension,
    List<String>? residents,
  }) =>
      LocationModel(
        id: id ?? this.id,
        name: name ?? this.name,
        residents: residents ?? this.residents,
        type: type ?? this.type,
        dimension: dimension ?? this.dimension,
      );

  static List<LocationModel> listFromJson(List<dynamic> list) {
    final List<LocationModel> listModels = list
        .map((dynamic e) => LocationModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return listModels;
  }

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
