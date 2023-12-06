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

  double msTokmh = 3.6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
        builder: (context, state) {
          if (state is WeatherBlocSuccess) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(30),
                  topStart: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: backgroundGradientColors,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      color: Colors.white),
                  //Widget to display my ubication basic info
                  MyUbication(
                    areaName: state.weather.areaName!,
                    maxTemp: state.weather.tempMax!.celsius!.round(),
                    minTemp: state.weather.tempMin!.celsius!.round(),
                    feelsLikeTemp:
                        state.weather.tempFeelsLike!.celsius!.round(),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    '4-Days Forecasts:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Widget to display detailed air concentration
                  AirConcentration(
                    cloudiness: state.weather.cloudiness!.toInt(),
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
                        additionalData: state.weather.rainLast3Hours
                                .toString()
                                .isEmpty
                            ? "${state.weather.rainLast3Hours.toString()} mm"
                            : "0 mm",
                      ),
                      SquareInfoDisplay(
                        icon: Icons.air_rounded,
                        infoTitle: "WIND SPEED",
                        data:
                            ("${(state.weather.windSpeed! * msTokmh).roundToDouble().toString()} km/h"),
                        additionalInfoTitle: "Wind Direction:",
                        additionalData:
                            "${state.weather.windDegree.toString()}º",
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
                        data: DateFormat()
                            .add_jm()
                            .format(state.weather.sunrise!),
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
                        additionalData: state.weather.snowLast3Hours
                                .toString()
                                .isEmpty
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
      ),
    );
  }
}
