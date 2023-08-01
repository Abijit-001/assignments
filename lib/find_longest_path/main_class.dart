import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'path_finder.dart';

import 'matrix.dart';

Future<void> main() async {
  stdout.write("Enter rows and column number : ");
  int m = int.tryParse(stdin.readLineSync()!)!;
  int n = int.tryParse(stdin.readLineSync()!)!;


  Matrix matrix = Matrix(m, n);

  matrix.printMatrix();

  stdout.write("Enter starting point rows and column number : ");
  int mStart = int.tryParse(stdin.readLineSync()!)!;
  int nStart = int.tryParse(stdin.readLineSync()!)!;

  stdout.write("Enter ending point rows and column number : ");
  int mEnd = int.tryParse(stdin.readLineSync()!)!;
  int nEnd = int.tryParse(stdin.readLineSync()!)!;

  Point start = Point(mStart, nStart);
  Point end = Point(mEnd, nEnd);

  matrix.markPoints([start, end]);

  PathFinder pathFinder = PathFinder();
  List<Point> longestPath = pathFinder.findLongestPath(matrix.data, start, end);

  print("\nLongest Path with ${longestPath.length} point visited : ");
  for (Point point in longestPath) {
    stdout.write("(${point.x}, ${point.y})");
  }

  for (int i = 0; i <= longestPath.length; i++) {
    print("\n");
    // Timer(Duration(seconds: 1), () { matrix.markPoints(longestPath.sublist(0, i));});
    await Future.delayed(Duration(milliseconds: 500));
    matrix.markPoints(longestPath.sublist(0, i));

  }
}
