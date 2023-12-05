abstract class TangibleAsset {
  String name;
  int price;
  String color;

  TangibleAsset({
    required this.name,
    required this.price,
    required this.color,
  });
}

class Book extends TangibleAsset {
  String isbn;

  Book({
    required this.isbn, required super.name, required super.price, required super.color,
  });
}

class Computer  extends TangibleAsset {
  String makerName;

  Computer({
    required this.makerName, required super.name, required super.price, required super.color,
  });
}

