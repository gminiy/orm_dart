import 'dart:io';

void copy(String source, String target) {
  final sourceFile = File(source);
  final copyFile = File(target);

  copyFile.writeAsStringSync(sourceFile.readAsStringSync());
}

void main() {
  final String currentDir = Directory(Platform.script.toFilePath()).parent.path;

  copy('$currentDir/source.txt', "$currentDir/copy.txt");
}
