class Word {
  String word = 'VowEl';
  List<String> vowels = ['a', 'e', 'i', 'o', 'u'];

  bool isVowel(int i) {
    final String selectedChar = word.substring(i, i + 1);
    print(selectedChar);

    return vowels.contains(selectedChar.toLowerCase());
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}

void main() {
  final Word word = Word();

  print('isVowel Test');
  // lowercase test
  print(word.isVowel(1));
  // uppercase test
  print(word.isVowel(3));
  // consonant test
  print(word.isVowel(0));
  print(word.isVowel(2));
  print(word.isVowel(4));

  print('isConsonant Test');
  // lowercase test
  print(word.isConsonant(1));
  // uppercase test
  print(word.isConsonant(3));
  // consonant test
  print(word.isConsonant(0));
  print(word.isConsonant(2));
  print(word.isConsonant(4));
}
