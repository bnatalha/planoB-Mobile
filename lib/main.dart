import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app_module.dart';
import 'app/shared/models/user_model.dart';
import 'app/shared/utils/box_names.dart';


void main() async {
  await Hive.initFlutter();

  BoxNames.userRepositoryBox = await Hive.openBox<UserModel>(BoxNames.userRepositoryBoxName);

  runApp(ModularApp(module: AppModule()));
}
