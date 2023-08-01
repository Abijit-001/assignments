/*


import 'dart:io';
import 'dart:convert';
import 'dart:math';

class Coordinate {
  final double latitude;
  final double longitude;

  Coordinate(this.latitude, this.longitude);
}

double haversineDistance(Coordinate coord1, Coordinate coord2) {
  const R = 6371; // Radius of the Earth in km
  var lat1 = coord1.latitude * pi / 180;
  var lon1 = coord1.longitude * pi / 180;
  var lat2 = coord2.latitude * pi / 180;
  var lon2 = coord2.longitude * pi / 180;

  var dlon = lon2 - lon1;
  var dlat = lat2 - lat1;

  var a = pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);
  var c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return R * c;
}

Future<void> main() async {
  var file = File('path_to_your_file.json'); // Replace with your file path
  var contents;

  if (await file.exists()) {
    contents = await file.readAsString();
  } else {
    print("File does not exist");
    return;
  }

  var data = jsonDecode(contents);
  var coordinates = (data['coordinates'] as List)
      .map((coord) => Coordinate(coord['latitude'].toDouble(), coord['longitude'].toDouble()))
      .toList();

  var referencePoint = Coordinate(23.75642324214002, 90.37446923862953);
  var range = 20; // Range in km

  for (var coord in coordinates) {
    var distance = haversineDistance(referencePoint, coord);
    if (distance <= range) {
      print('Coordinate ${coord.latitude}, ${coord.longitude} is within the range of $range km.');
    } else {
      print('Coordinate ${coord.latitude}, ${coord.longitude} is out of the range of $range km.');
    }
  }
}
*/
