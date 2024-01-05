import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_tune/bloc/weather_bloc_bloc.dart';
import 'package:weather_tune/widgets/details_page/air_concentration.dart';
import 'package:weather_tune/widgets/details_page/my_ubication.dart';
import 'package:weather_tune/widgets/details_page/square_info.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Color> backgroundGradientColors = [
    Colors.indigo.shade900,
    Colors.indigo,
    Colors.deepPurple,
    Colors.purple,
  ];

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

  double msTokmh = 3.6;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSuccess) {
          return Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              color: const Color.fromARGB(78, 20, 24, 27),
              image: getBackground(state.weather.weatherMain!),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Icon(Icons.keyboard_arrow_down_rounded,
                    color: Colors.white),
                //Widget to display my ubication basic info
                MyUbication(
                  areaName: state.weather.areaName!,
                  maxTemp: state.weather.tempMax!.celsius!.round(),
                  minTemp: state.weather.tempMin!.celsius!.round(),
                  feelsLikeTemp: state.weather.tempFeelsLike!.celsius!.round(),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Detailed forecast:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Display weather forecast widget
                // Container(
                //   width: MediaQuery.of(context).size.width - 75,
                //   height: MediaQuery.of(context).size.height - 800,
                //   decoration: BoxDecoration(
                //     color: const Color.fromARGB(112, 0, 0, 0),
                //     borderRadius: const BorderRadius.all(
                //       Radius.circular(15),
                //     ),
                //     border: Border.all(
                //       color: const Color.fromARGB(255, 247, 196, 213),
                //       width: 1.5,
                //     ),
                //   ),
                //   child: const ForecastView(),
                // ),
                const SizedBox(height: 10),
                // Widget to display detailed air concentration
                AirConcentration(
                  cloudiness: state.weather.cloudiness!.round().toInt(),
                  humidity: state.weather.humidity!.toInt(),
                  pressure: state.weather.pressure!.toInt(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquareInfoDisplay(
                      icon: Icons.water_drop_outlined,
                      infoTitle: "RAIN",
                      data: state.weather.rainLastHour.toString().isEmpty
                          ? "${state.weather.rainLastHour.toString()} mm"
                          : "0 mm",
                      additionalInfoTitle: "Last 3 hours:",
                      additionalData:
                          state.weather.rainLast3Hours.toString().isEmpty
                              ? "${state.weather.rainLast3Hours.toString()} mm"
                              : "0 mm",
                    ),
                    SquareInfoDisplay(
                      icon: Icons.air_rounded,
                      infoTitle: "WIND SPEED",
                      data:
                          ("${(state.weather.windSpeed! * msTokmh).roundToDouble().toString()} km/h"),
                      additionalInfoTitle: "Wind Direction:",
                      additionalData: "${state.weather.windDegree.toString()}º",
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SquareInfoDisplay(
                      icon: Icons.wb_sunny_rounded,
                      infoTitle: "SUNRISE",
                      data:
                          DateFormat().add_jm().format(state.weather.sunrise!),
                      additionalInfoTitle: "Sunset: ",
                      additionalData:
                          DateFormat().add_jm().format(state.weather.sunset!),
                    ),
                    SquareInfoDisplay(
                      icon: Icons.ac_unit_rounded,
                      infoTitle: "SNOW",
                      data: state.weather.snowLastHour.toString().isEmpty
                          ? "${state.weather.snowLastHour.toString()} mm"
                          : "0 mm",
                      additionalInfoTitle: "Last 3 hours:",
                      additionalData:
                          state.weather.snowLast3Hours.toString().isEmpty
                              ? "${state.weather.snowLast3Hours.toString()} mm"
                              : "0 mm",
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Placeholder();
        }
      },
    );
  }
}
