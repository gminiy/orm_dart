class Person {
  String name;

  Person({
    required this.name,
  });
}

void main() {
  List<Person> people = [Person(name: '홍길동'), Person(name: '한석봉')];
  // index 탐색
  for (int i = 0; i < people.length; i++) {
    print(people[i].name);
  }

  // for-in
  for (final person in people) {
    print(person.name);
  }

  // for-in with destructuring pattern
  for (final Person(:name) in people) {
    print(name);
  }

  // forEach, 사용 않는 것을 권장.
  people.forEach((person) => print(person.name));
}