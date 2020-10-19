import './installment_model.dart';

class BillModel {
  BillModel({
    this.value,
    this.tag,
    this.installment,
    this.dateModified,
  });

  double value;
  String tag;
  InstallmentModel installment;    
  final DateTime dateAdded = DateTime.now();
  DateTime dateModified;
}
