import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quickreels/app/core/base/base_use_case.dart';
import 'package:quickreels/app/domain/model/failure.dart';
import 'package:quickreels/app/domain/model/place_details.dart';

class FetchGeolocationDetailsUseCase
    extends BaseUseCase<PlaceDetailsBO, DefaultParams> {
  @override
  Future<PlaceDetailsBO> call(DefaultParams param) async {
    final place = await _determinePlaceMark();
    if (place != null) {
      return PlaceDetailsBO(
          locality: place.locality ?? "",
          administrativeArea: place.administrativeArea ?? "",
          country: place.country ?? "");
    } else {
      throw const Failure(message: "Geolocation details unavailable");
    }
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Placemark?> _determinePlaceMark() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      debugPrint("Location services are disabled.");
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        debugPrint("Location permissions are denied");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      debugPrint(
          "Location permissions are permanently denied, we cannot request permissions.");
      return null;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition();
    List<Placemark> result =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return result.firstOrNull;
  }
}
