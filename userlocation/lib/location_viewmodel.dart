import 'package:flutter/foundation.dart';
import 'package:userlocation/location_model.dart';

class LocationViewModel extends ChangeNotifier {
  LocationModel _userLocationModel;

  void onLocationUpdated(LocationModel userLocationModel) {
    this._userLocationModel = userLocationModel;
    notifyListeners();
  }

  String getFormattedLocation() {
    if (_userLocationModel == null) {
      return "Unknown";
    } else {
      return "${_userLocationModel.latitude},${_userLocationModel.longitude}";
    }
  }
}
