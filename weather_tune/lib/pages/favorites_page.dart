import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tune/bloc/weather_bloc_bloc.dart';
import 'package:weather_tune/models/favorite_page/location_data.dart';
import 'package:weather_tune/widgets/favorites_page/location_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int unit = 1;
  String userID = "";

  @override
  void initState() {
    super.initState();
    _getUserID();
    _getProfilePic();
  }

  Future<void> _getUserID() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      userID = user.uid;
    }
  }

  Future<void> _getProfilePic() async {
    DocumentSnapshot user = await FirebaseFirestore.instance
        .collection('UserInfo')
        .doc(userID)
        .get();
    var userData = user.data() as Map<String, dynamic>;
    setState(() {
      unit = userData['chosenUnit'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite Locations',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.grey.shade900,
        foregroundColor: const Color.fromARGB(207, 255, 255, 255),
        toolbarHeight: 50,
      ),
      body: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
        builder: (context, state) {
          if (state is WeatherBlocSuccess) {
            final List<LocationData> locations = [
              LocationData(
                  '${state.city1.areaName}',
                  state.city1.weatherConditionCode!,
                  unit == 1
                      ? '${state.city1.temperature!.celsius!.round()}º C'
                      : unit == 2
                          ? '${state.city1.temperature!.kelvin!.round()}K'
                          : '${state.city1.temperature!.fahrenheit!.round()}º F'),
              LocationData(
                  '${state.city2.areaName}',
                  state.city2.weatherConditionCode!,
                  unit == 1
                      ? '${state.city2.temperature!.celsius!.round()}º C'
                      : unit == 2
                          ? '${state.city2.temperature!.kelvin!.round()}K'
                          : '${state.city2.temperature!.fahrenheit!.round()}º F'),
              LocationData(
                  '${state.city3.areaName}',
                  state.city3.weatherConditionCode!,
                  unit == 1
                      ? '${state.city3.temperature!.celsius!.round()}º C'
                      : unit == 2
                          ? '${state.city3.temperature!.kelvin!.round()}K'
                          : '${state.city3.temperature!.fahrenheit!.round()}º F'),
              LocationData(
                  '${state.city4.areaName}',
                  state.city4.weatherConditionCode!,
                  unit == 1
                      ? '${state.city4.temperature!.celsius!.round()}º C'
                      : unit == 2
                          ? '${state.city4.temperature!.kelvin!.round()}K'
                          : '${state.city4.temperature!.fahrenheit!.round()}º F'),
              LocationData(
                  '${state.city5.areaName}',
                  state.city5.weatherConditionCode!,
                  unit == 1
                      ? '${state.city5.temperature!.celsius!.round()}º C'
                      : unit == 2
                          ? '${state.city5.temperature!.kelvin!.round()}K'
                          : '${state.city5.temperature!.fahrenheit!.round()}º F'),
              LocationData(
                  '${state.city6.areaName}',
                  state.city6.weatherConditionCode!,
                  unit == 1
                      ? '${state.city6.temperature!.celsius!.round()}º C'
                      : unit == 2
                          ? '${state.city6.temperature!.kelvin!.round()}K'
                          : '${state.city6.temperature!.fahrenheit!.round()}º F'),
              // Add more locations as needed
            ];
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/favorites_bkg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: ListView.builder(
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 5.0),
                        child: LocationBox(
                          location: locations[index].location,
                          weatherCondition: locations[index].weatherCondition,
                          temperature: locations[index].temperature,
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
