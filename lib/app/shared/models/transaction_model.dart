import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';

import 'user_model.dart';
import 'account_model.dart';
import 'category_model.dart';

class TransactionModel {
  int id;
  UserModel user;
  AccountModel source;
  AccountModel destination;
  CategoryModel category;
  double value;
  String description;
  DateTime date;
  final List<String> tags; // TODO pra q?

  TransactionModel({
    this.id,
    this.user,
    this.source,
    this.destination,
    this.category,
    this.date,
    this.value = 0.0,
    this.description = "",
    this.tags,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    try {
      dev.log('$json', name: 'TransactionModel.fromJson');

      return TransactionModel(
        id: json['id'] as int,
        user: UserModel?.fromJson(json['user']) ?? null,
        source: AccountModel?.fromJson(json['source']) ?? null,
        destination: AccountModel?.fromJson(json['destination']) ?? null,
        category: json['category'] != null
            ? CategoryModel?.values[json['category']]
            : null,
        date: DateTime.tryParse(json['date'] ?? '') ?? null,
        value: json['value'] as double,
        description: json['description'] ?? "",
        tags: (jsonDecode(json['tags']) as List<dynamic>)
                ?.map((e) => e?.toString())
                ?.toList() ??
            <String>[],
      );
    } catch (e) {
      dev.log('error', name: 'TransactionModel.fromJson', error: e);
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'id': id,
      'user': user?.toJson(),
      'source': source?.toJson(),
      'destination': destination?.toJson(),
      'category': category?.index,
      'date': date?.toIso8601String(),
      'value': value,
      'description': description,
      'tags': jsonEncode(tags),
    };

    dev.log('$map', name: 'TransactionModel.toJson');

    return map;
  }

  copyWith({
    int id,
    UserModel user,
    AccountModel source,
    AccountModel destination,
    // final String paymentType,
    CategoryModel category,
    double value,
    String description,
    DateTime date,
    List<String> tags,
  }) {
    return TransactionModel(
        id: id ?? this.id,
        user: user ?? this.user,
        source: source ?? this.source,
        destination: destination ?? this.destination,
        category: category ?? this.category,
        date: date ?? this.date,
        value: value ?? this.value,
        description: description ?? this.description,
        tags: tags ?? this.tags);
  }
}
