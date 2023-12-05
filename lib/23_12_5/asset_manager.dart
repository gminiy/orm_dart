abstract interface class Thing {
  double getWeight();

  double setWeight(double weight);
}

abstract class Asset {
  String name;
  int price;

  Asset({
    required this.name,
    required this.price,
  });
}

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double weight;

  TangibleAsset({
    required this.color,
    required this.weight,
    required super.name,
    required super.price,
  });

  @override
  double getWeight() {
    return weight;
  }

  @override
  double setWeight(double weight) {
    if (weight <= 0) {
      throw Exception("weight must over 0");
    }

    this.weight = weight;

    return this.weight;
  }
}

class Book extends TangibleAsset {
  String isbn;

  Book({
    required super.weight,
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
  });
}

class Computer extends TangibleAsset implements Thing {
  String makerName;
  Computer({
    required super.weight,
    required super.name,
    required super.price,
    required super.color,
    required this.makerName,
  });
}
