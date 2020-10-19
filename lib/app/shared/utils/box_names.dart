import 'package:hive/hive.dart';

class Boxes {
  static const String userRepositoryBoxName = 'UserRepositoryBox';
  static const String accountRepositoryBoxName = 'AccountRepositoryBox';
  static const String transactionRepositoryBoxName = 'TransactionRepositoryBoxName';

  static Map<String, Box> boxes = Map<String, Box>();
}
