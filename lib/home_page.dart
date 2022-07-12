import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:plant_health_tracker/components/plant_card.dart';
import 'package:plant_health_tracker/model/plant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Plant>? plants;
  @override
  void initState() {
    super.initState();
    readData();
  }

  void readData() async {
    final db = FirebaseDatabase.instance.ref('plantcare-7c507-default-rtdb');
    db.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print(data);
    });
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.green,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(32),
              alignment: Alignment.centerLeft,
              child: Text(
                "My Plants",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Flexible(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                      ),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return PlantCard(
                          plant: Plant.fromMap({
                            "Pump_State": false,
                            "plant_name": "Plant1",
                            "img_url":
                                "https://images.unsplash.com/photo-1567990989224-6441e1483ac8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGliaXNjdXMlMjBmbG93ZXJ8ZW58MHx8MHx8&w=1000&q=80",
                            "data": [
                              {
                                "Ambient_Light": 230,
                                "Humidity": 77,
                                "Soil_Moisture": 90,
                                "Temperature": 32,
                                "Timestamp": "2022-07-12 13:15:24"
                              },
                              {
                                "Ambient_Light": 130,
                                "Humidity": 12,
                                "Soil_Moisture": 111,
                                "Temperature": 19.5,
                                "Timestamp": "2022-07-12 12:15:24"
                              },
                              {
                                "Ambient_Light": 221,
                                "Humidity": 70,
                                "Soil_Moisture": 95,
                                "Temperature": 29.5,
                                "Timestamp": "2022-07-12 17:15:24"
                              }
                            ]
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
