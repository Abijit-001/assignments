import 'dart:convert';
import 'dart:io';
import 'dart:math';

Future<void> main() async {
  var json = File('C:/Users/HP/Documents/lat_long.json');
  var contents;
  if (await json.exists()) {
    contents = await json.readAsString();
  } else {
    print("File does not exist");
    return;
  }

  var data = jsonDecode(contents);

  var coordinates = (data['coordinates'] as List)
      .map((coordinate) => Point<double>(coordinate['latitude'].toDouble(), coordinate['longitude'].toDouble()))
      .toList();

  stdout.writeln('Enter reference coordinate : ');
  stdout.write('Latitude : ');
  double? startLatitude=double.tryParse(stdin.readLineSync()!);
  stdout.write('Longitude : ');
  double? startLongitude=double.tryParse(stdin.readLineSync()!);
  Point<double> referencePoint = Point(startLatitude!, startLongitude!);

  // var referencePoint = Point(23.75642324214002, 90.37446923862953);

  stdout.write('Range (km) : ');
  var range = int.tryParse(stdin.readLineSync()!);

  printCoordinates(coordinates, referencePoint, range!);

}

void printCoordinates(List<Point<double>> coordinates, Point<double> referencePoint, int range) {
  for (var coordinate in coordinates) {
    var distance = calculateDistance(referencePoint, coordinate);
    if (distance <= range) {
      print('✓ - Coordinate ${coordinate.x}, ${coordinate.y} is within the range.');
    } else {
      print('X - Coordinate ${coordinate.x}, ${coordinate.y} is out of the range.');
    }
  }
}

double calculateDistance(start, end) {
  var p = 0.017453292519943295;
  var a = 0.5 - cos((end.x - start.x) * p) / 2 +
      cos(start.x * p) * cos(end.x * p) *
          (1 - cos((end.y - start.y) * p)) / 2;
  return 12742 * asin(sqrt(a));
}