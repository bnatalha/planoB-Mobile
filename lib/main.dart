import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app_module.dart';
import 'app/shared/models/user_model.dart';
import 'app/shared/utils/box_names.dart';

void main() async {
  await Hive.initFlutter();

  await initBoxes();

  runApp(ModularApp(module: AppModule()));
}

Future<void> initBoxes() async {
  Boxes.boxes[Boxes.userRepositoryBoxName] = await Hive.openBox<String>(
    Boxes.userRepositoryBoxName,
  );

  Boxes.boxes[Boxes.accountRepositoryBoxName] = await Hive.openBox<String>(
    Boxes.accountRepositoryBoxName,
  );

  Boxes.boxes[Boxes.transactionRepositoryBoxName] = await Hive.openBox<String>(
    Boxes.transactionRepositoryBoxName,
  );
}
