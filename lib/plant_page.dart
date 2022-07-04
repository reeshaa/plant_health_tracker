import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'components/stats_card.dart';

class PlantPage extends StatelessWidget {
  const PlantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          "Anthurium",
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
              'https://st.depositphotos.com/2632165/4026/i/450/depositphotos_40264933-stock-photo-young-plant.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: ListView(
            children: [
              StatsCard(
                xVals: [1, 2.2, 3],
                yVals: [0.9, 2.1, 5],
                title: "Moisture",
                actionWidget: ElevatedButton(
                  onPressed: () {},
                  child: Text("Water me"),
                ),
              ),
              StatsCard(
                xVals: [1, 2, 3],
                yVals: [0.3, 2.1, 3],
                title: "Moisture",
              ),
              StatsCard(
                xVals: [1, 2, 3],
                yVals: [1.4, 2.2, 3.1],
                title: "Moisture",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
