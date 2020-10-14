import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app_module.dart';

void main() async {
  await Hive.initFlutter();
  runApp(ModularApp(module: AppModule()));
}
