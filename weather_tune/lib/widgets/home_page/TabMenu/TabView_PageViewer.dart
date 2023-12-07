import 'package:flutter/material.dart';
import 'package:weather_tune/widgets/home_page/TabMenu/Forecast/Forecast_PageView.dart';
import 'package:weather_tune/widgets/home_page/TabMenu/Today/TodayTab_PageView/today_pageview.dart';

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
                TodayView(),
                ForecastView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
