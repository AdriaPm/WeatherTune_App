import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_tune/bloc/weather_bloc_bloc.dart';
import 'package:weather_tune/components/bottombar.dart';
import 'package:weather_tune/components/slider_bottom_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: BottomBarWidget(
            favorites_active: false,
            home_active: true,
            profile_active: false,
            search_active: false,
            settings_active: false),
        body: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              color: const Color.fromARGB(78, 20, 24, 27),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  "images/HomeBackground/background.jpg",
                ).image,
              ),
            ),
            child: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
              builder: (context, state) {
                if (state is WeatherBlocSuccess) {
                  return Stack(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '📍 ${state.weather.areaName}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Good Morning',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Center(
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 550,
                                  child: getWeatherIcon(
                                      state.weather.weatherConditionCode!),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "${state.weather.temperature!.celsius!.round()}ºC",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 55,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Center(
                                child: Text(
                                  state.weather.weatherMain!.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                  DateFormat('EEEE dd ·')
                                      .add_jm()
                                      .format(state.weather.date!),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: BottomSheetContainer(),
                    ),
                  ]);
                } else {
                  return Container();
                }
              },
            )));
  }
}
