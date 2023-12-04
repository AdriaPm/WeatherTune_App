import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_tune/bloc/weather_bloc_bloc.dart';

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
              Tab(text: 'Hourly Forecast'),
              Tab(text: 'Weekly Forecast'),
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
        if(state is WeatherBlocSuccess){
        return Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.grey.shade300,
          child: const Center(
            child: Text(
              'Hourly Forecast',
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.black,
              ),
            ),
          ),
        );
        }else {
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
        if(state is WeatherBlocSuccess){
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey.shade300,
      child: Center(
        child: Text(
          '${state.weatherlist.last}',
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.black,
          ),
        ),
      ),
    );
        }else {
          return Container();
        }
  });
  }
}