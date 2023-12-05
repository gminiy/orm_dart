abstract class Asset {
  String name;
  int price;

  Asset({
    required this.name,
    required this.price,
  });
}

abstract class TangibleAsset  extends Asset {
  String color;

  TangibleAsset({
    required this.color, required super.name, required super.price,
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

