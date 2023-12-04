import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_tune/bloc/weather_bloc_bloc.dart';
import 'package:weather_tune/widgets/home_page/pageview_temp.dart';
import 'package:weather_tune/widgets/home_page/pageview_today.dart';

class ForecastTabs extends StatefulWidget {
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.purple),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Icon(
              Icons.expand_less_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Today'),
              Tab(text: '3 Hour Weekly Forecast'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
        builder: (context, state) {
      if (state is WeatherBlocSuccess) {
        return Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.grey.shade300,
          child: Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.weatherlist
                  .length, // Change this number to the desired count
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 100,
                  margin: EdgeInsets.all(8),
                  color: Colors
                      .blue, // You can set different colors or styles here
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        DateFormat('`YYYY-MM-DD')
                            .add_jm()
                            .format(state.weatherlist[index].date!),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  )),
                );
              },
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
