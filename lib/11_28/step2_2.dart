class Person {
  late String name;

  void sayHello() {
    print('Hello my name is $name');
  }
}

void main() {
  var person = Person();
  person.name = 'gmin';
  person.sayHello();
}
