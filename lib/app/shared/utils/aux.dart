String treatValue(String val) {
  return val.replaceAll(RegExp(r'\.'), '').replaceAll(RegExp(r'\,'), '.');
}
