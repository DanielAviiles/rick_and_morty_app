class ParamsRequestModel {
  ParamsRequestModel({
    this.name = '',
    this.offset = 0,
    this.endPoint,
  });

  final String name;
  final int offset;
  final String? endPoint;

  ParamsRequestModel copyWith({String? name, int? offset, String? endPoint}) =>
      ParamsRequestModel(
        name: name ?? this.name,
        offset: offset ?? this.offset,
        endPoint: endPoint ?? this.endPoint,
      );
}
