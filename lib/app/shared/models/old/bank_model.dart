import './bill_model.dart';
class BankModel {
  BankModel({
    this.balance,
    this.savingBalance,
    this.creditLimit,
    this.expireMonth,
    this.bills = const <BillModel>[],
  });

  double balance;
  double savingBalance;
  double get totalBalance => balance + savingBalance;
  double creditLimit;
  DateTime expireMonth;
  final List<BillModel> bills;
}
