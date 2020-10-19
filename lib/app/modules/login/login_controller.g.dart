// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$userModelAtom = Atom(name: '_LoginControllerBase.userModel');

  @override
  Observable<UserModel> get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(Observable<UserModel> value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$isLoggedAtom = Atom(name: '_LoginControllerBase.isLogged');

  @override
  Observable<bool> get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(Observable<bool> value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_LoginControllerBase.isLoading');

  @override
  Observable<bool> get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(Observable<bool> value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future<bool> login({String username, String password, bool create = false}) {
    return _$loginAsyncAction.run(() =>
        super.login(username: username, password: password, create: create));
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
isLogged: ${isLogged},
isLoading: ${isLoading}
    ''';
  }
}
