abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

void main() {
  X obj = A();
  obj.a();
  // obj.b(); X에 없어서 안됨
  // obj.c(); X에 없어서 안됨

  Y y1 = A();
  Y y2 = B();

  y1.a(); //'Aa' 출력
  y2.a(); //'Ba' 출력

  // 연습문제 13-3
  Y ya = A();
  Y yb = B();

  List<Y> yList =[];
  yList.add(ya);
  yList.add(yb);

  for (final elem in yList) {
    elem.b();
  }
}
