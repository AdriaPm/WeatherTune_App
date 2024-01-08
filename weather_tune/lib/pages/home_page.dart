import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_tune/bloc/weather_bloc_bloc.dart';
import 'package:weather_tune/components/bottombar.dart';
import 'package:weather_tune/components/home_page/home_expandedinfo.dart';
import 'package:weather_tune/data/getweather_getbackground.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int unit = 1;
  String userID = "";

  @override
  void initState() {
    super.initState();
    _getUserID();
    _getUnit();
  }

  Future<void> _getUserID() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      userID = user.uid;
    }
  }

  Future<void> _getUnit() async {
    try {
      DocumentSnapshot user = await FirebaseFirestore.instance
          .collection('UserInfo')
          .doc(userID)
          .get();
      var userData = user.data() as Map<String, dynamic>;
      setState(() {
        unit = userData['chosenUnit'];
      });
    } catch (e) {
      print('Error finding unit: $e');
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
            radar_active: false,
            settings_active: false),
        body: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
          builder: (context, state) {
            if (state is WeatherBlocSuccess) {
              return Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(78, 20, 24, 27),
                    image: getBackground(state.weather.weatherMain!),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
                                  unit == 1
                                      ? "${state.weather.temperature!.celsius!.round()}ºC"
                                      : unit == 2
                                          ? "${state.weather.temperature!.kelvin!.round()}K"
                                          : "${state.weather.temperature!.fahrenheit!.round()}ºF",
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
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: BottomSheetContainer(),
                    ),
                  ]));
            } else {
              return Container();
            }
          },
        ));
  }
}
