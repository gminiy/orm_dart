Future<String> timeoutFuture() async {
  await Future.delayed(Duration(seconds: 6));

  return 'ok';
}

void main() {
  timeoutFuture().timeout(Duration(seconds: 3), onTimeout: () {
    return 'Time out occured';
  }).then((value) {
    print(value);
  }).catchError((error) {
    print('Error: $error');
    return;
  });
}
