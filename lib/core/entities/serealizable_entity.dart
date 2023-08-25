mixin SerealizableResponseEntity<T> {
  String get tableName;
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}