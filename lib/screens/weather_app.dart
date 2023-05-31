// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app_ui/models/weather_location.dart';
import 'package:weather_app_ui/widgets/single_weather.dart';
import 'package:weather_app_ui/widgets/slider_dot.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentPage = 0;
  late String bgImage;

  _onPageChange(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (locationList[_currentPage].weatherType == 'Sunny') {
      bgImage = 'assets/sunny.jpg';
    }else if(locationList[_currentPage].weatherType == 'Night'){
      bgImage = 'assets/night.jpg';
    }else if(locationList[_currentPage].weatherType == 'Cloudy'){
      bgImage = 'assets/cloudy.jpeg';
    }else{
      bgImage = 'assets/rainy.jpg';
    }
    return Scaffold(
      // to hide streach the container beyond app bar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // remove shadow in android
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.search,
          color: Colors.white,
          size: 30,
        ),
        title: Text(''),
        actions: [
          // container don't support on tap
          Container(
            margin: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                bgImage,
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
        // first image then opaque color and then text
        child: Stack(
          children: [
            // image
            Image.asset(
              bgImage,
              fit: BoxFit.cover,
              // to cover the full height and width
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 120,
                left: 25,
              ),
              child: Row(
                children: [
                  for (int i = 0; i < locationList.length; i++)
                    if (i == _currentPage)
                      SliderDot(isActive: true)
                    else
                      SliderDot(isActive: false)
                ],
              ),
            ),
            PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onPageChange,
              itemCount: locationList.length,
              itemBuilder: (ctx, i) => SingleWeather(index: i, ctx: null,)
            ),
          ],
        ),
      ),
    );
  }
}
