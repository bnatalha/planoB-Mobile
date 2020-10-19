import '../user_model.dart';
import './bank_model.dart';

class PersonModel {
  PersonModel({
    this.user,
  });

  final UserModel user;
  final Set<BankModel> banks = Set<BankModel>();
}
