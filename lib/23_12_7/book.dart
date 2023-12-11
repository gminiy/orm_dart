import 'package:intl/intl.dart';

class Book {
  String title;
  DateTime publishDate = DateTime.now();
  String comment;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Book({
    required this.title,
    required this.publishDate,
    required this.comment,
  });

  // 제목과 출간일이 같으면 같은 책으로 판단한다. 또한 List, Set, Map 등의 컬렉션에 넣어도 동일 객체로 판단한다.
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Book &&
            runtimeType == other.runtimeType &&
            formatter.format(publishDate) == formatter.format(other.publishDate) &&
            title == other.title;
  }

  // hashCode도 함께 오버라이드
  @override
  int get hashCode => formatter.format(publishDate).hashCode ^ title.hashCode;

  // deep copy 를 지원한다
  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
  }) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      comment: comment ?? this.comment,
    );
  }

  @override
  String toString() {
    return 'Book{title: $title, publishDate: $publishDate, comment: $comment}';
  }
}

void main() {
  final DateTime now = DateTime.now();
  final DateTime oneDayAfter = now.add(Duration(days: 1));
  final DateTime twoDayAfter = now.add(Duration(days: 2));
  final Book book1 = Book(
    title: 'title1',
    publishDate: now,
    comment: 'comment1',
  );
  final Book book2 = Book(
    title: 'title1',
    publishDate: now,
    comment: 'comment1-1',
  );
  final Book book3 = Book(
    title: 'title2',
    publishDate: twoDayAfter,
    comment: 'comment2',
  );
  final Book book4 = Book(
    title: 'title3',
    publishDate: oneDayAfter,
    comment: 'comment3',
  );

  // 제목과 출간일이 같으면 같은 책으로 판단한다. 또한 List, Set, Map 등의 컬렉션에 넣어도 동일 객체로 판단한다.
  final Book book5 = Book(
    title: 'title1',
    publishDate: DateTime.now(),
    comment: 'comment1',
  );
  Set<Book> bookSet = {book1, book5};


  print('${bookSet.length}');
  print(bookSet);


  //Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 오래된 순서대로 정렬한다.
  List<Book> bookList = [book1, book2, book3, book4];
  bookList.sort((a, b) => a.publishDate.millisecondsSinceEpoch
      .compareTo(b.publishDate.millisecondsSinceEpoch));

  bookList.forEach((element) {
    print(element.title);
  }); // result: title1, title1-1, title3, title2

  final Book originBook =
      Book(title: "origin", publishDate: now, comment: "origin book comment");
  final Book copyBook = originBook.copyWith();
  print('origin: $originBook');
  print('copy: $copyBook');
}
