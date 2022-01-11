import 'dart:io';

void main() { 
  final boatStream = getBoatStream();
  boatStream.listen((event) {
    print('ค่าที่ได้จาก Stream ==> $event');
    print('----------------------------');
  });
}

Stream<int> getBoatStream() async* {
  for (var i = 1; i <= 5; i++) {
    stdout.write('Sent boat $i');
    stdin.readLineSync();
    yield i;
  }
}
