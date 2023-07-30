// import 'package:flutter/material.dart';
// import 'goo';
// class LocationPickerScreen extends StatefulWidget {
//   @override
//   _LocationPickerScreenState createState() => _LocationPickerScreenState();
// }
//
// class _LocationPickerScreenState extends State<LocationPickerScreen> {
//   LocationResult? _pickedLocation;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Picker'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             LocationResult? result = await Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => PlacePicker(
//                   apiKey: 'YOUR_GOOGLE_MAPS_API_KEY',
//                   onPlacePicked: (result) {
//                     setState(() {
//                       _pickedLocation = result;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                   initialPosition: LatLng(37.7749, -122.4194),
//                   useCurrentLocation: true,
//                 ),
//               ),
//             );
//             if (result != null) {
//               setState(() {
//                 _pickedLocation = result;
//               });
//             }
//           },
//           child: Text('Pick a Location'),
//         ),
//       ),
//     );
//   }
// }
