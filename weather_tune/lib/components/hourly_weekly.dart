import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_tune/bloc/weather_bloc_bloc.dart';
import 'package:weather_tune/widgets/home_page/pageview_temp.dart';
import 'package:weather_tune/widgets/home_page/pageview_today.dart';

class ForecastTabs extends StatefulWidget {
  const ForecastTabs({super.key});

  @override
  _ForecastTabsState createState() => _ForecastTabsState();
}

class _ForecastTabsState extends State<ForecastTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Two tabs: Hourly and Weekly
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Icon(
              Icons.expand_less_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey.shade700,
            indicator: const BoxDecoration(),
            tabs: const [
              Tab(
                child: Text(
                  'Today',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  'Forecast',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                HourlyForecast(),
                WeeklyForecast(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSuccess) {
          return PageView(
            scrollDirection: Axis.horizontal,
            children: [
              SunInfo(
                  apiinputrise: state.weather.sunrise!,
                  captionrise: "Sunrise",
                  imagePathrise: "images/weather_icons/6.png",
                  apiinputset: state.weather.sunset!,
                  captionset: "Sunset",
                  imagePathset: "images/weather_icons/12.png"),
              TempInfo(
                  apiinputmax: state.weather.tempMax!.celsius!.round(),
                  captionrise: "High",
                  imagePathrise: "images/weather_icons/13.png",
                  apiinputmin: state.weather.tempMin!.celsius!.round(),
                  captionset: "Low",
                  imagePathset: "images/weather_icons/14.png")
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast({super.key});

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
    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSuccess) {
          return Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.weatherlist
                  .length, // Change this number to the desired count
              itemBuilder: (BuildContext context, int index) {
                bool isFirstElement = index == 0;
                return Container(
                  width: 65,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isFirstElement
                        ? const Color.fromARGB(200, 149, 117, 205)
                        : const Color.fromARGB(200, 49, 27, 146),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.pink.shade50,
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55,
                        child: Text(
                          DateFormat('EEEE,\nd/M')
                              .add_jm()
                              .format(state.weatherlist[index].date!),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: getWeatherIcon(
                            state.weatherlist[index].weatherConditionCode!),
                      ),
                      Text(
                        "${state.weatherlist[index].temperature!.celsius!.round()}ºC",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
