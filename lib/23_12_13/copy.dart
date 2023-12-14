import 'dart:io';

void main() async {
  final String currentDir = Directory(Platform.script.toFilePath()).parent.path;
  final sampleFile = File('$currentDir/sample.csv');
  final copyFile = File('$currentDir/copy.csv');
  final sampleFileString = await sampleFile.readAsString().catchError((e) {
    print(e);

    return '';
  });
  final replaced = sampleFileString.replaceAll('한석봉', '김석봉');

  await copyFile.writeAsString(replaced);
}
