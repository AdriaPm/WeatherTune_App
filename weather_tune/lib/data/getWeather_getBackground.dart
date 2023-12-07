import 'package:flutter/material.dart';

Widget getWeatherIcon(int code) {
  switch (code) {
    case >= 200 && < 300:
      return Image.asset('images/weather_icons/1.png');
    case >= 300 && < 400:
      return Image.asset('images/weather_icons/2.png');
    case >= 500 && < 600:
      return Image.asset('images/weather_icons/3.png');
    case >= 600 && < 700:
      return Image.asset('images/weather_icons/4.png');
    case >= 700 && < 800:
      return Image.asset('images/weather_icons/5.png');
    case == 800:
      return Image.asset('images/weather_icons/6.png');
    case > 800 && <= 804:
      return Image.asset('images/weather_icons/7.png');
    default:
      return Image.asset('images/weather_icons/7.png');
  }
}

DecorationImage getBackground(String description) {
  switch (description) {
    case "Clouds":
      return DecorationImage(
        fit: BoxFit.cover,
        image: Image.asset(
          "images/HomeBackground/background_cloud.jpg",
        ).image,
      );
    case "Clear":
      return DecorationImage(
        fit: BoxFit.cover,
        image: Image.asset(
          "images/HomeBackground/background_clear.jpg",
        ).image,
      );
    default:
      return DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            "images/loginbackground.jpg",
          ).image);
  }
}
