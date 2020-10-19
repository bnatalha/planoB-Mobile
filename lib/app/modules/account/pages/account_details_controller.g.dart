// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details/account_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountDetailsController on _AccountDetailsControllerBase, Store {
  Computed<AccountModel> _$accountComputed;

  @override
  AccountModel get account =>
      (_$accountComputed ??= Computed<AccountModel>(() => super.account,
              name: '_AccountDetailsControllerBase.account'))
          .value;

  @override
  String toString() {
    return '''
account: ${account}
    ''';
  }
}
