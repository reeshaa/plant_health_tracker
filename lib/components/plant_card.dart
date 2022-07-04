import 'dart:ui';

import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  final String? plantName;
  final String? imgUrl;

  const PlantCard({Key? key, this.plantName, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: new NetworkImage(imgUrl!),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey.withOpacity(0.1),
            child: Text(
              "CHOCOLATE",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
