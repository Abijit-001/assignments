
import 'dart:io';
import 'dart:math';

class Matrix {
  late List<List<int>> data;

  Matrix(int numRows, int numCols) {
    data = List.generate(numRows, (_) => List<int>.filled(numCols, 0));
  }

  void printMatrix() {
    print("Matrix:");
    for (List<int> row in data) {
      for (int element in row) {
        stdout.write('$element\t');
      }
      stdout.write('\n');
    }
  }

  void markPoints(List<Point> points) {
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data[i].length; j++) {
        bool isMarked = points.any((point) => point.x == i && point.y == j);
        stdout.write(isMarked ? "x\t" : "o\t");
      }
      print("\n");
    }
  }
}