import 'dart:math';

class PathFinder {
  List<Point> findLongestPath(List<List<int>> matrix, Point start, Point end) {
    List<Point> currentPath = [];
    List<Point> longestPath = [];

    _findPath(matrix, start, end, currentPath, longestPath);

    return longestPath;
  }

  void _findPath(List<List<int>> matrix, Point current, Point end, List<Point> currentPath, List<Point> longestPath) {
    currentPath.add(current);

    if (current == end) {
      if (currentPath.length > longestPath.length) {
        longestPath.clear();
        longestPath.addAll(currentPath);
      }
    } else {
      List<Point> neighbors = _getNeighbors(matrix, current);

      for (Point neighbor in neighbors) {
        if (!currentPath.contains(neighbor)) {
          _findPath(matrix, neighbor, end, currentPath, longestPath);
        }
      }
    }

    currentPath.removeLast();
  }

  List<Point> _getNeighbors(List<List<int>> matrix, Point point) {
    List<Point> neighbors = [];

    int numRows = matrix.length;
    int numCols = matrix[0].length;

    if (point.x > 0) neighbors.add(Point(point.x - 1, point.y));
    if (point.x < numRows - 1) neighbors.add(Point(point.x + 1, point.y));
    if (point.y > 0) neighbors.add(Point(point.x, point.y - 1));
    if (point.y < numCols - 1) neighbors.add(Point(point.x, point.y + 1));

    return neighbors;
  }
}