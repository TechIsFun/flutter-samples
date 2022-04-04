import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LocationModel extends Equatable {
  final double latitude;
  final double longitude;

  LocationModel({@required this.latitude, @required this.longitude});

  /// Location is valid if
  /// - latitude and longitude are both not null and
  /// - latitude and longitude are not both 0
  bool get isValid => (latitude != null &&
      longitude != null &&
      (latitude != 0 && latitude != 0));

  @override
  List<Object> get props => [this.latitude, this.longitude];

  @override
  String toString() {
    return 'LocationModel{latitude: $latitude, longitude: $longitude}';
  }
}
