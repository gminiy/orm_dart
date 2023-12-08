class Word {
  String word = 'vowEl';
  List<String> vowels = ['a', 'e', 'i', 'o', 'u'];

  bool isVowel(int i) {
    final String selectedChar = word.substring(i, i + 1);
    print(selectedChar);

    return vowels.contains(selectedChar.toLowerCase());
  }
}

void main() {
  final Word word = Word();
  // lowercase test
  print(word.isVowel(1));
  // uppercase test
  print(word.isVowel(3));
  // consonant test
  print(word.isVowel(0));
  print(word.isVowel(2));
  print(word.isVowel(4));
}
