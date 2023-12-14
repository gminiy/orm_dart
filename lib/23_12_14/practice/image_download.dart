import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

final String currentDir = Directory(Platform.script.toFilePath()).parent.path;

void main() async {
  Uint8List image = await downloadImage('https://alimipro.com/favicon.ico');
  final File savedImage = await saveFile(image, 'icon.ico');
  print('용량: ${await savedImage.length()} 바이트');
  print('\n');

  // 병렬 처리 확인
  List<String> images = [
    'https://previews.123rf.com/images/sportactive/sportactive1408/sportactive140800274/30829826-%EC%B5%9C%EA%B3%A0-%ED%92%88%EC%A7%88%EC%9D%98-%EA%B3%A0%ED%95%B4%EC%83%81%EB%8F%84-%EC%82%AC%EC%A7%84.jpg',
    'https://previews.123rf.com/images/sportactive/sportactive1406/sportactive140600003/29171784-%EC%B5%9C%EA%B3%A0-%ED%92%88%EC%A7%88%EC%9D%98-%EA%B3%A0%ED%95%B4%EC%83%81%EB%8F%84-%EC%82%AC%EC%A7%84.jpg',
    'https://e0.pxfuel.com/wallpapers/238/479/desktop-wallpaper-high-resolution-2560x1440-pixel.jpg'
  ];

  await downloadImagesSync(images);
  await downloadImagesAsync(images);

  // 잘못된 url 체크
  final Uint8List notFoundImage = await downloadImage(
      'https://www.kwnews.co.kr/page/view/2023121415322324146/test.ico');
}

Future<Uint8List> downloadImage(String url) async {
  try {
    print('다운로드 시작');
    final stopwatch = Stopwatch()..start();
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != HttpStatus.ok) {
      final File defaultImage = File('$currentDir/favicon.ico');

      return await defaultImage.readAsBytes();
    }
    stopwatch.stop();
    print('다운로드 끝');
    print('========');
    print('소요시간: ${stopwatch.elapsed}');

    return response.bodyBytes;
  } catch (e) {
    print(e);
    final File defaultImage = File('$currentDir/favicon.ico');

    return await defaultImage.readAsBytes();
  }
}

Future<List<Uint8List>> downloadImagesSync(List<String> urls) async {
  final List<Uint8List> images = [];
  print('다운로드(downloadImagesSync) 시작');
  final stopwatch = Stopwatch()..start();
  for (final String url in urls) {
    final Uint8List image = await downloadImage(url);
    images.add(image);
  }
  stopwatch.stop();
  print('다운로드(downloadImagesSync) 끝');
  print('========');
  print('소요시간(downloadImagesSync) : ${stopwatch.elapsed}');
  print('\n');

  return images;
}

Future<List<Uint8List>> downloadImagesAsync(List<String> urls) async {
  final List<Future<Uint8List>> futures =
      urls.map((url) => downloadImage(url)).toList();
  print('다운로드(downloadImagesAsync) 시작');
  final stopwatch = Stopwatch()..start();
  final List<Uint8List> images = await Future.wait(futures);
  stopwatch.stop();
  print('다운로드(downloadImagesAsync) 끝');
  print('========');
  print('소요시간(downloadImagesAsync) : ${stopwatch.elapsed}');
  print('\n');

  return images;
}

Future<File> saveFile(Uint8List bytes, String fileName) async {
  final File file = File('$currentDir/$fileName');

  return await file.writeAsBytes(bytes);
}
