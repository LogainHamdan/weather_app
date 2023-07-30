import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:weather_app/services/weather.dart';
import 'loading_screen.dart';
import '../services/location.dart';
import '../utilities/constants.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final WeatherModel weatherData;

  const LocationScreen({super.key, required this.weatherData});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  bool isLoaded = false;

  final ImageProvider _image = const AssetImage('images/city_background.jpg');
  final ImageProvider _networkImage =
      const NetworkImage('images/city_background.jpg');

  void updateUi() {
    temp = widget.weatherData.temp.toInt();
    cityName = widget.weatherData.name;
    icon = widget.weatherData.getWeatherIcon();
    description = widget.weatherData.getMessage();
    super.initState();
  }

  int temp = 0;
  String cityName = '';
  String icon = '';
  String description = '';

  // late CityScreen cityScreen;
  WeatherModel? _selectedCountryData;

  //
  // void _navigateToCountryPickerScreen() async {
  //   WeatherModel? selectedCountryData = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const CityScreen()),
  //   );
  //
  //   if (selectedCountryData != null) {
  //     setState(() {
  //       _selectedCountryData =
  //           selectedCountryData; // Update the selected country data.
  //     });
  //   }
  // }

  @override
  void initState() {
    temp = widget.weatherData.temp.toInt();
    cityName = widget.weatherData.name;
    icon = widget.weatherData.getWeatherIcon();
    description = widget.weatherData.getMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const NetworkImage(
                    'https://source.unsplash.com/random/?nature,day'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            constraints: const BoxConstraints.expand(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.5)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        backgroundColor: Colors.black12,
                        onPressed: () async {
                          Location location = Location();
                          await location.getCurrentLocation();
                        },
                        child: const Center(
                          child: Icon(
                            Icons.near_me,
                            size: 40.0,
                            color: kSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CityScreen()));
                        },
                        backgroundColor: Colors.black12,

                        // onPressed: () async {
                        //   final List<WeatherModel?> result =
                        //       await Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) =>
                        //                   const CityScreen()));
                        //   result[0] == null ? updateUi() : updateUi();
                        //   setState(() {});
                        child: const Center(
                          child: Icon(
                            Icons.location_city,
                            size: 40.0,
                            color: kSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text('$cityScreen'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$temp',
                          style: kTempTextStyle,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 10),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 7,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                  // shape: BoxShape.circle,
                                  ),
                            ),
                            const Text(
                              'now',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'Spartan MB',
                                letterSpacing: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Text(
                  '$description',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding: EdgeInsets.all(34),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
