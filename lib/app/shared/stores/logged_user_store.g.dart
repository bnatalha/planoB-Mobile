// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoggedUserStore on _LoggedUserStoreBase, Store {
  final _$currentUserAtom = Atom(name: '_LoggedUserStoreBase.currentUser');

  @override
  Observable<UserModel> get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(Observable<UserModel> value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$_LoggedUserStoreBaseActionController =
      ActionController(name: '_LoggedUserStoreBase');

  @override
  void setCurrentUser(UserModel user) {
    final _$actionInfo = _$_LoggedUserStoreBaseActionController.startAction(
        name: '_LoggedUserStoreBase.setCurrentUser');
    try {
      return super.setCurrentUser(user);
    } finally {
      _$_LoggedUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser}
    ''';
  }
}
