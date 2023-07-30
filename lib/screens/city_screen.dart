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

  WeatherModel _openCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,

      // textStyle: TextStyle(fontFamily: 'Spartan MB')),
      onSelect: (Country country) async {
        Map<String, dynamic> networkHelper = await NetworkHelper(
                url:
                    'https://api.openweathermap.org/data/2.5/weather?q=${country.name}&appid={$kApiKey}')
            .getData();
        selectedCountry = WeatherModel().fromJsonToWeatherModel(networkHelper)!;

        setState(() {});
        returnToMainPage(selectedCountry);
      },
    );
    return selectedCountry;
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Expanded(
                child: FloatingActionButton(
                  onPressed: () {
                    WeatherModel result = _openCountryPicker();
                  },
                  backgroundColor: Colors.blueGrey,
                  child: const Text(
                    'Pick a country',
                    style: TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
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
