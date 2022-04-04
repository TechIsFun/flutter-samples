import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';

import 'location_model.dart';

typedef UserLocationCallback = Function(LocationModel userLocationModel);

class UserLocationWidget extends StatelessWidget {
  final LocationPermissionLevel permissionLevel;
  final LocationAccuracy accuracy;

  final Widget child;
  final UserLocationCallback userLocationCallback;
  final LocationPermissions locationPermissions = LocationPermissions();

  UserLocationWidget(
      {Key key,
      @required this.child,
      @required this.userLocationCallback,
      this.permissionLevel = LocationPermissionLevel.locationWhenInUse,
      this.accuracy = LocationAccuracy.medium})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getUserLocationAndNotifyCallback();
    return child;
  }

  Future<LocationModel> _getUserLocation() async {
    final status =
        await locationPermissions.checkPermissionStatus(level: permissionLevel);
    //print('status: $status');
    if (status == PermissionStatus.granted) {
      return _retrieveLocation();
    } else {
      final newStatus = await locationPermissions.requestPermissions(
          permissionLevel: permissionLevel);
      //print('newStatus: $newStatus');
      if (newStatus == PermissionStatus.granted) {
        return _retrieveLocation();
      }
    }

    return null;
  }

  Future<LocationModel> _retrieveLocation() async {
    final position = await Geolocator.getLastKnownPosition(
        forceAndroidLocationManager: false);
    if (position != null) {
      return _mapToLocationModel(position);
    } else {
      final position =
          await Geolocator.getCurrentPosition(desiredAccuracy: accuracy);
      if (position != null) {
        return _mapToLocationModel(position);
      }
    }

    return null;
  }

  LocationModel _mapToLocationModel(Position position) {
    return LocationModel(
        latitude: position.latitude, longitude: position.longitude);
  }

  Future<void> _getUserLocationAndNotifyCallback() async {
    LocationModel userLocation = await _getUserLocation();
    userLocationCallback?.call(userLocation);
  }
}
