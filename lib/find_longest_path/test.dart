/*

import 'dart:io';
import 'dart:math';

void main() {
  stdout.write("Enter rows and column number : ");
  int m = int.tryParse(stdin.readLineSync()!)!;
  int n = int.tryParse(stdin.readLineSync()!)!;
  List<List<int>> maze=[];

  for (int i = 0; i < m; i++) {
    List<int> row=[];
    for (int j = 0; j < n; j++) {
      stdout.write("o   ");
      row.add(j);
    }
    maze.add(row);
    print("\n");
  }

  stdout.write("Enter starting point rows and column number : ");
  int mStart = int.tryParse(stdin.readLineSync()!)!;
  int nStart = int.tryParse(stdin.readLineSync()!)!;

  stdout.write("Enter ending point rows and column number : ");
  int mEnd = int.tryParse(stdin.readLineSync()!)!;
  int nEnd= int.tryParse(stdin.readLineSync()!)!;

  Point start = Point(mStart, nStart);
  Point end = Point(mEnd, nEnd);

  markPoints(mStart,nStart,mEnd,nEnd,m,n);

  List<Point> longestPath = findLongestPath(maze, start, end);

  print("\nLongest Path with ${longestPath.length} node visited.");
  for (Point point in longestPath) {
    stdout.write("(${point.x}, ${point.y})");
  }
}

List<Point> findLongestPath(
    List<List<int>> maze, Point start, Point end) {
  List<Point> currentPath = [];
  List<Point> longestPath = [];

  findPath(maze, start, end, currentPath, longestPath);

  return longestPath;
}

void findPath(List<List<int>> maze, Point current, Point end,
    List<Point> currentPath, List<Point> longestPath) {
  currentPath.add(current);

  if (current == end) {
    if (currentPath.length > longestPath.length) {
      longestPath.clear();
      longestPath.addAll(currentPath);
    }
  } else {
    List<Point> neighbors = getNeighbors(maze, current);

    for (Point neighbor in neighbors) {
      if (!currentPath.contains(neighbor)) {
        findPath(maze, neighbor, end, currentPath, longestPath);
      }
    }
  }

  currentPath.removeLast();
}

List<Point> getNeighbors(List<List<int>> maze, Point point) {
  List<Point> neighbors = [];

  int numRows = maze.length;
  int numCols = maze[0].length;

  if (point.x > 0) neighbors.add(Point(point.x - 1, point.y));
  if (point.x < numRows - 1) neighbors.add(Point(point.x + 1, point.y));
  if (point.y > 0) neighbors.add(Point(point.x, point.y - 1));
  if (point.y < numCols - 1) neighbors.add(Point(point.x, point.y + 1));

  return neighbors;
}

void markPoints(int mStart, int nStart, int mEnd, int nEnd, int m, int n) {

  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      ((i==mStart && j==nStart) || (i==mEnd && j==nEnd))? stdout.write("x   "): stdout.write("o   ");
    }
    print("\n");
  }
}
*/

/*
main() {
  stdout.write("Enter rows and column number : ");
  int m = int.tryParse(stdin.readLineSync()!)!;
  int n = int.tryParse(stdin.readLineSync()!)!;
  List<List<int>> maze=[];

  for (int i = 0; i < m; i++) {
    List<int> row=[];
    for (int j = 0; j < n; j++) {
      stdout.write("($i,$j)   ");
      row.add(j);
    }
    maze.add(row);
    print("\n");
  }

  stdout.write("Enter starting point rows and column number : $maze");
  int mStart = int.tryParse(stdin.readLineSync()!)!;
  int nStart = int.tryParse(stdin.readLineSync()!)!;

  stdout.write("Enter ending point rows and column number : ");
  int mEnd = int.tryParse(stdin.readLineSync()!)!;
  int nEnd= int.tryParse(stdin.readLineSync()!)!;

  markPoints(mStart,nStart,mEnd,nEnd,m,n);

  findPaths(maze, mEnd, nEnd);
}

void markPoints(int mStart, int nStart, int mEnd, int nEnd, int m, int n) {

  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      ((i==mStart && j==nStart) || (i==mEnd && j==nEnd))? stdout.write("x   "): stdout.write("(${i-1},${j-1})   ");
    }
    print("\n");
  }
}

void findPaths(List<List<int>> maze, int m, int n) {
  List<int> path = List<int>.filled(m + n - 1, 0);
  findPathsUtil(maze, m, n, 0,0, path, 0);
}
*/
import 'dart:io';

class Point {
  int x;
  int y;

  Point(this.x, this.y);

  @override
  String toString() {
    return '($x, $y)';
  }
}

bool isValidPoint(List<List<int>> matrix, int x, int y) {
  return x >= 0 && x < matrix.length && y >= 0 && y < matrix[0].length && matrix[x][y] == 1;
}

List<List<Point>> findPaths(List<List<int>> matrix, Point startPoint, Point endPoint) {
  List<List<Point>> allPaths = [];
  List<List<Point>> stack = [];

  if (!isValidPoint(matrix, startPoint.x, startPoint.y) || !isValidPoint(matrix, endPoint.x, endPoint.y)) {
    return allPaths; // No path is possible if either start or end point is invalid
  }

  stack.add([startPoint]);

  while (stack.isNotEmpty) {
    List<Point> currentPath = stack.removeLast();
    Point currentPoint = currentPath.last;

    if (currentPoint.x == endPoint.x && currentPoint.y == endPoint.y) {
      allPaths.add(currentPath);
    } else {
      List<Point> neighbors = [
        Point(currentPoint.x + 1, currentPoint.y), // Down
        Point(currentPoint.x - 1, currentPoint.y), // Up
        Point(currentPoint.x, currentPoint.y + 1), // Right
        Point(currentPoint.x, currentPoint.y - 1), // Left
      ];

      for (Point neighbor in neighbors) {
        if (isValidPoint(matrix, neighbor.x, neighbor.y) && !currentPath.contains(neighbor)) {
          List<Point> newPath = List.from(currentPath);
          newPath.add(neighbor);
          stack.add(newPath);
        }
      }
    }
  }

  return allPaths;
}

void printMatrixWithPaths(List<List<int>> matrix, List<Point> path) {
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[0].length; j++) {
      if (path.any((point) => point.x == i && point.y == j)) {
        // If cell is in the path, print a special character
        stdout.write('* ');
      } else {
        stdout.write('${matrix[i][j]} ');
      }
    }
    stdout.writeln();
  }
}

void main() {
  List<List<int>> matrix = [
    [1, 1, 0, 0, 1],
    [1, 0, 1, 1, 0],
    [0, 1, 0, 1, 1],
    [1, 1, 1, 1, 1],
    [0, 0, 1, 1, 1],
  ];

  Point startPoint = Point(0, 0);
  Point endPoint = Point(4, 4);

  List<List<Point>> paths = findPaths(matrix, startPoint, endPoint);

  if (paths.isEmpty) {
    print('No path found between $startPoint and $endPoint.');
  } else {
    print('All paths between $startPoint and $endPoint:');
    int pathIndex = 1;
    for (var path in paths) {
      print('Path $pathIndex:');
      printMatrixWithPaths(matrix, path);
      print('');
      pathIndex++;
    }
  }
}
