import 'package:plano_b/app/shared/models/model.dart';
import 'package:plano_b/app/shared/models/user_model.dart';

class CategoryModel implements Model {
  final UserModel user;
  final String name;
  final String description;

  const CategoryModel({
    this.user,
    this.name,
    this.description,
  });

  @override
  CategoryModel.fromJson(Map<String, dynamic> json)
      : user = json['user'],
        name = json['name'],
        description = json['description'];

  @override
  Map<String, dynamic> toJson() => {
        'user': user,
        'name': name,
        'description': description,
      };
}
