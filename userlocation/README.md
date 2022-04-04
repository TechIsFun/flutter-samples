# User Location

Questo progetto mostra come richiedere il permesso di accesso alla posizione e ottenere la posizione dell'utente.
La logica è implementata in `user_location_widget.dart`.


## Dipendenze da includere in pubspec.yaml

* location_permissions (https://pub.dev/packages/location_permissions)
* geolocator (https://pub.dev/packages/geolocator)

## Chiavi da aggiungere in Info.plist

```
<key>NSLocationAlwaysUsageDescription</key>
<string>Needed to access location</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>Needed to access location</string>
```

## Permessi da aggiungere nel AndroidManifest:

```
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

## Esempio di utilizzo

```
   @override
   Widget build(BuildContext context) {
     return UserLocationWidget(
       userLocationCallback: (location) {
         _viewModel.onUserLocationUpdated(location);
       },
       child: ChangeNotifierProvider<MyViewModel>.value(
         value: sl(),
         child: Container(
           child: MapWidget(googleMapController: _controller),
         ),
       ),
     );
   }
```
