final String globalVariable = "Some string";

void doSome() {
  print(globalVariable);
}

class SomeClass {
  const SomeClass({
    required this.intProperty,
    required this.stringProperty,
  });

  final int intProperty;
  final String stringProperty;

  void greetings() {
    print(intProperty);
    print(stringProperty);
  }
}
