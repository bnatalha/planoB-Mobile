abstract class Model {
  const Model();
  Model.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
