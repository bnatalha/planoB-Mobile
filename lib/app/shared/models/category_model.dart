enum CategoryModel {
  deposit,
  transaction,
  // ... TODO
}

extension CategoryParsing on CategoryModel {
  String asString() {
    switch (this) {
      case CategoryModel.deposit:
        return 'Depósito';
        break;
      case CategoryModel.transaction:
        return 'Transação';
        break;
      default:
        return '';
        break;
    }
  }
}
