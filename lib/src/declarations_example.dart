final String globalVariable = "Some string";

void doSomething() {
  print(globalVariable);
}

class SomeClass {
  const SomeClass({
    required this.intProperty,
    required this.stringProperty,
  });

  final String intProperty;
  final String stringProperty;

  void greetings() {
    print(intProperty);
    print(stringProperty);
  }
}
