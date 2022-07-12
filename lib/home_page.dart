import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:plant_health_tracker/components/plant_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                          plantName: 'Plant $index',
                          imgUrl:
                              'https://st.depositphotos.com/2632165/4026/i/450/depositphotos_40264933-stock-photo-young-plant.jpg',
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
