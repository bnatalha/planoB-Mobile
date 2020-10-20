import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:plano_b/app/shared/models/account_model.dart';
import 'package:plano_b/app/shared/stores/logged_user_store.dart';
import 'package:plano_b/app/shared/utils/box_names.dart';

import '../abstract/account_repository_abstract.dart';

class AccountRepositoryHive implements AccountRepositoryAbstract {
  AccountRepositoryHive() {
    _initBox();
  }

  Box<String> hive;

  void _initBox() {
    hive = Boxes.boxes[Boxes.accountRepositoryBoxName];
  }

  @override
  void dispose() {
    hive.close();
  }

  @override
  Future<bool> createAccount(int userId, String bankName) async {
    try {
      final AccountModel model = AccountModel(
        id: '${Modular.get<LoggedUserStore>().currentUser.value},$bankName'
            .hashCode,
        user: Modular.get<LoggedUserStore>().currentUser.value,
        name: bankName,
        balance: 0,
      );

      hive.put(model.id, jsonEncode(model.toJson()));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteAccount(int id) async {
    try {
      hive.delete(id);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Map<String, dynamic>> getAccountFromId(int id) {
    try {
      return jsonDecode(hive.get(id));
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAccountsFromUserId(int userId) async {
    final List<AccountModel> accounts = hive.values
        .map((String value) => AccountModel.fromJson(jsonDecode(value)))
        .toList();
    return accounts
        .where((AccountModel account) => account.user.id == userId)
        .map((AccountModel model) => model.toJson())
        .toList();
  }

  @override
  Future<bool> updateAccountBankName(int id, String newBankName) async {
    try {
      AccountModel model = AccountModel.fromJson(jsonDecode(hive.get(id)));
      model.copyWith(name: newBankName);
      hive.put(model.id, jsonEncode(model.toJson()));
      return true;
    } catch (e) {
      return false;
    }
  }
}
