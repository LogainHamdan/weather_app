import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import '../services/networking.dart';
import '../services/weather.dart';
import '../utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  CityScreenState createState() => CityScreenState();
}

class CityScreenState extends State<CityScreen> {
  WeatherModel selectedCountry = WeatherModel();

  _openCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,

      // textStyle: TextStyle(fontFamily: 'Spartan MB')),
      onSelect: (Country country) {
        NetworkHelper(
                url:
                    'https://api.openweathermap.org/data/2.5/weather?q=${country.name}&appid=$kApiKey')
            .getData()
            .then((networkHelper) {
          selectedCountry.fromJsonToWeatherModel(networkHelper);

          returnToMainPage(selectedCountry);
        });
      },
    );
  }

  void returnToMainPage(WeatherModel weatherModel) {
    if (mounted) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LocationScreen(weatherData: weatherModel)));
    }
  }

  // void _selectCountryAndReturn(WeatherModel countryData) {
  //   if (selectedCountry != null) {
  //     // WeatherModel? countryData = _openCountryPicker();
  //     Navigator.pop(context, countryData);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: '2',
                  backgroundColor: Colors.black12,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 40.0,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 80),
                backgroundColor: const Color(0xD89E9E9E), // Text color
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Button padding
                textStyle: const TextStyle(fontSize: 18), // Text style
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Button border radius
                ),
                elevation: 4, // Elevation
              ),
              onPressed: () {
                _openCountryPicker();
              },
              child: const Text(
                'Pick a country',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Spartan MB',
                    // fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),

            // FloatingActionButton(
            //   onPressed: () {
            //     _selectCountryAndReturn();
            //   },
            //   backgroundColor: Colors.blueGrey,
            //   child: const Text(
            //     'Pick a country',
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 15),
            //   ),
            // )

            // Container(
            //   padding: const EdgeInsets.all(20.0),
            //   child: null,
            // ),
            // FloatingActionButton(
            //   onPressed: () {},
            //   child: const Text(
            //     'Get Weather',
            //     style: kButtonTextStyle,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
