abstract class IronMan {
  String name;
  String suitColor;

  IronMan(this.name, this.suitColor);

  // This is an abstract method. It must be implemented by subclasses.
  void fly();

  // This is an abstract method. It must be implemented by subclasses.
  void shootLasers();

  // This is an abstract method. It must be implemented by subclasses.
  void withStandDamage();
}

//@override 구문을 사용하여 abstract method 구현
class Mark50 extends IronMan {
  var flyHeight;

  Mark50(String name, String suitColor, this.flyHeight)
      : super(name, suitColor);
  @override
  void shootLasers() {
    print('$name is shooting laser!');
  }

  @override
  void fly() {
    print('$name is flying in $flyHeight');
  }

  @override
  void withStandDamage() {
    print('$name is getting damaged');
  }
}

void main() {
  Mark50 mark50 = Mark50("mark50", "red", 100);

  mark50.fly();
  mark50.shootLasers();
  mark50.withStandDamage();
}
