import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:plant_health_tracker/model/plant.dart';

import 'components/stats_card.dart';

class PlantPage extends StatelessWidget {
  final Plant plant;
  const PlantPage({
    Key? key,
    required this.plant,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final List<double> timestamps = plant.data
    //     .map((e) => e.Timestamp.millisecondsSinceEpoch.toDouble())
    //     .toList();
    final List<double> timestamps =
        List.generate(plant.data.length, (index) => index.toDouble());
    final List<double> lightY =
        plant.data.map((e) => e.Ambient_Light.toDouble()).toList();
    final List<double> humidityY =
        plant.data.map((e) => e.Humidity.toDouble()).toList();
    final List<double> soilMoistureY =
        plant.data.map((e) => e.Soil_Moisture.toDouble()).toList();
    final List<double> temperatureY =
        plant.data.map((e) => e.Temperature.toDouble()).toList();
    print(timestamps);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        title: Text(
          plant.plant_name ?? "Title",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              plant.img_url ?? "",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: ListView(
            children: [
              StatsCard(
                xVals: timestamps,
                yVals: soilMoistureY,
                title: "Soil Moisture",
                actionWidget: Visibility(
                  visible: !plant.Pump_State,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Water me"),
                  ),
                ),
              ),
              StatsCard(
                xVals: timestamps,
                yVals: lightY,
                title: "Ambient Light",
              ),
              StatsCard(
                xVals: timestamps,
                yVals: humidityY,
                title: "Humidity",
              ),
              StatsCard(
                xVals: timestamps,
                yVals: temperatureY,
                title: "Temperature",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
