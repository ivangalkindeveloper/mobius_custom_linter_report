abstract class Element implements AnalysisTarget {
  List<Element> get children;

  Element? get declaration;

  String get displayName;

  bool get hasAlwaysThrows;

  bool get hasDeprecated;

  bool get hasFactory;

  bool get hasImmutable;

  ...

  bool get hasIsTest;

  bool get hasIsTestGroup;

  bool get hasLiteral;

  bool get hasMustBeConst;
}