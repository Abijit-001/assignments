import 'dart:io';
import 'dart:math';


main() {
  stdout.write("Enter starting coordinate : ");
  Point start = takeInput();
  stdout.write("Enter ending coordinate : ");
  Point end = takeInput();
  print("Distance is - ${calculateDistance(start, end)}");
}

Point<num> takeInput() {
  double mStart = double.tryParse(stdin.readLineSync()!)!;
  double nStart = double.tryParse(stdin.readLineSync()!)!;

  Point start = Point(mStart, nStart);
  return start;
}

double calculateDistance(start, end) {
  var p = 0.017453292519943295;
  var a = 0.5 - cos((end.x - start.x) * p) / 2 +
      cos(start.x * p) * cos(end.x * p) *
          (1 - cos((end.y - start.y) * p)) / 2;
  return 12742 * asin(sqrt(a));
}