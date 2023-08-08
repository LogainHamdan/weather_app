// import 'package:flutter/material.dart';
// import 'ma';
//
// class LocationPickerScreen extends StatefulWidget {
//   @override
//   _LocationPickerScreenState createState() => _LocationPickerScreenState();
// }
//
// class _LocationPickerScreenState extends State<LocationPickerScreen> {
//   LatLng? selectedPosition;
//
//   void _onMapCreated(GoogleMapController controller) {
//     // Use this method if you need to interact with the map controller
//   }
//
//   void _selectLocation(LatLng location) {
//     setState(() {
//       selectedPosition = location;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Picker'),
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(0, 0),
//           zoom: 13.0,
//         ),
//         onTap: _selectLocation,
//         markers: selectedPosition != null
//             ? {
//                 Marker(
//                   markerId: MarkerId('selectedLocation'),
//                   position: selectedPosition!,
//                 ),
//               }
//             : {},
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           Navigator.pop(context, selectedPosition);
//         },
//         label: Text('Select Location'),
//         icon: Icon(Icons.location_on),
//       ),
//     );
//   }
// }
