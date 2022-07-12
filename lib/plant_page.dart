import 'dart:convert';
import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_health_tracker/model/plant.dart';

import 'components/stats_card.dart';

class PlantPage extends StatefulWidget {
  final String plantId;
  final String name;
  final String imgUrl;
  PlantPage({
    Key? key,
    required this.plantId,
    required this.name,
    required this.imgUrl,
  }) : super(key: key);

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  late Plant plant;
  late DatabaseReference db;
  @override
  void initState() {
    super.initState();
    db = FirebaseDatabase.instance
        .ref('plantcare-7c507-default-rtdb/' + widget.plantId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(widget.name.toUpperCase()),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              widget.imgUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: StreamBuilder<DatabaseEvent>(
              stream: db.onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator.adaptive());
                } else if (!snapshot.hasData) {
                  return Center(child: Text("Err"));
                }

                // Parse the data as a Plant object
                Plant plant =
                    Plant.fromJson(jsonEncode(snapshot.data!.snapshot.value));

                List<double> timestamps = <double>[];
                List<double> lightY = <double>[];
                List<double> humidityY = <double>[];
                List<double> soilMoistureY = <double>[];
                List<double> temperatureY = <double>[];

                double i = 1;
                plant.data.forEach((e) {
                  if (DateTime.now().difference(e.Timestamp).inHours > 12)
                    return;
                  timestamps.add(i++);
                  lightY.add(e.Ambient_Light.toDouble());
                  humidityY.add(e.Humidity.toDouble());
                  soilMoistureY.add(e.Soil_Moisture.toDouble());
                  temperatureY.add(e.Temperature);
                });

                print('${plant.data.length} ${timestamps.length}');

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      StatsCard(
                        xVals: timestamps,
                        yVals: soilMoistureY,
                        title: "Soil Moisture",
                        color: Colors.blue.shade600,
                        actionWidget: Row(
                          children: [
                            Icon(
                              Icons.water_drop_outlined,
                              color: Colors.black,
                            ),
                            CupertinoSwitch(
                              value: plant.Pump_State,
                              activeColor: Colors.blue.shade200,
                              trackColor: Colors.red.shade100,
                              onChanged: (bool value) {
                                db.update({
                                  'Pump_State': !plant.Pump_State,
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      StatsCard(
                        xVals: timestamps,
                        yVals: lightY,
                        title: "Ambient Light",
                        color: Colors.amber.shade800,
                        horizontalInterval2: 50,
                      ),
                      StatsCard(
                        xVals: timestamps,
                        yVals: humidityY,
                        title: "Humidity",
                        color: Colors.purple,
                        horizontalInterval2: 5,
                      ),
                      StatsCard(
                        xVals: timestamps,
                        yVals: temperatureY,
                        title: "Temperature",
                        horizontalInterval2: 4,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
