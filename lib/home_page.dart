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
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.green.shade300,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all(32),
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Plants",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  // height: size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "It's a bright and sunny day today",
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                "24°C",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: GridView.count(crossAxisCount: 2, children: [
                          PlantCard(
                            plantId: 'Plant1',
                            name: 'Syngonium',
                            imgUrl:
                                'https://gardenerspath.com/wp-content/uploads/2022/01/How-to-Grow-Arrowhead-Vine-Cover.jpg',
                          ),
                          PlantCard(
                            plantId: 'Plant2',
                            name: 'Sevanthi',
                            imgUrl:
                                'https://www.gseller.co.uk/wp-content/uploads/2020/03/CHRYS.jpg',
                          ),
                          PlantCard(
                            plantId: 'Plant2',
                            name: 'Rose',
                            imgUrl:
                                'https://66.media.tumblr.com/b6d0fadd1983a8513ca66ce54dc5e1a4/tumblr_pb41a79oD81wcookgo4_500.jpg',
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Team 8"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
