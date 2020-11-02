enum CategoryModel {
  deposit,
  transfer,
  withdrawal,
  // ... TODO
}

extension CategoryParsing on CategoryModel {
  String asString() {
    switch (this) {
      case CategoryModel.deposit:
        return 'Depósito';
        break;
      case CategoryModel.transfer:
        return 'Transferência';
        break;
      case CategoryModel.withdrawal:
        return 'Retirada';
        break;
      default:
        return '';
        break;
    }
  }
}
