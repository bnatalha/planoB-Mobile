// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<String> _$firstNameComputed;

  @override
  String get firstName =>
      (_$firstNameComputed ??= Computed<String>(() => super.firstName,
              name: '_HomeControllerBase.firstName'))
          .value;
  Computed<String> _$lastNameComputed;

  @override
  String get lastName =>
      (_$lastNameComputed ??= Computed<String>(() => super.lastName,
              name: '_HomeControllerBase.lastName'))
          .value;

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName}
    ''';
  }
}
