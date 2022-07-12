// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:intl/intl.dart';

class Plant {
  final List<Log> data;
  final bool Pump_State;
  final String? plant_name;

  final String? img_url;

  Plant({
    required this.data,
    required this.Pump_State,
    required this.plant_name,
    required this.img_url,
  });

  Plant copyWith({
    List<Log>? data,
    bool? Pump_State,
    String? plant_name,
    String? img_url,
  }) {
    return Plant(
      data: data ?? this.data,
      Pump_State: Pump_State ?? this.Pump_State,
      plant_name: plant_name ?? this.plant_name,
      img_url: img_url ?? this.img_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
      'Pump_State': Pump_State,
      'plant_name': plant_name,
      'img_url': img_url,
    };
  }

  factory Plant.fromMap(Map<String, dynamic> map) {
    return Plant(
      data: List<Log>.from(
        (map['data'] as List<dynamic>).map<Log>(
          (x) => Log.fromMap(x as Map<String, dynamic>),
        ),
      ),
      Pump_State: map['Pump_State'] as bool,
      plant_name: map['plant_name'] as String?,
      img_url: map['img_url'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Plant.fromJson(String source) =>
      Plant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlantModel(data: $data, Pump_State: $Pump_State, plant_name: $plant_name, img_url: $img_url)';
  }
}

class Log {
  final int Ambient_Light;
  final int Humidity;
  final int Soil_Moisture;
  final double Temperature;
  final DateTime Timestamp;
  Log({
    required this.Ambient_Light,
    required this.Humidity,
    required this.Soil_Moisture,
    required this.Temperature,
    required this.Timestamp,
  });

  Log copyWith({
    int? Ambient_Light,
    int? Humidity,
    int? Soil_Moisture,
    double? Temperature,
    DateTime? Timestamp,
  }) {
    return Log(
      Ambient_Light: Ambient_Light ?? this.Ambient_Light,
      Humidity: Humidity ?? this.Humidity,
      Soil_Moisture: Soil_Moisture ?? this.Soil_Moisture,
      Temperature: Temperature ?? this.Temperature,
      Timestamp: Timestamp ?? this.Timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Ambient_Light': Ambient_Light,
      'Humidity': Humidity,
      'Soil_Moisture': Soil_Moisture,
      'Temperature': Temperature,
      'Timestamp': Timestamp,
    };
  }

  factory Log.fromMap(Map<String, dynamic> map) {
    return Log(
      Ambient_Light: map['Ambient_Light'].toInt() as int,
      Humidity: map['Humidity'].toInt() as int,
      Soil_Moisture: map['Soil_Moisture'].toInt() as int,
      Temperature: map['Temperature'].toDouble() as double,
      Timestamp: DateFormat('yyyy-MM-dd HH:mm:ss').parse(map['Timestamp']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Log.fromJson(String source) =>
      Log.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Log(Ambient_Light: $Ambient_Light, Humidity: $Humidity, Soil_Moisture: $Soil_Moisture, Temperature: $Temperature, Timestamp: $Timestamp)';
  }

  @override
  bool operator ==(covariant Log other) {
    if (identical(this, other)) return true;

    return other.Ambient_Light == Ambient_Light &&
        other.Humidity == Humidity &&
        other.Soil_Moisture == Soil_Moisture &&
        other.Temperature == Temperature &&
        other.Timestamp == Timestamp;
  }

  @override
  int get hashCode {
    return Ambient_Light.hashCode ^
        Humidity.hashCode ^
        Soil_Moisture.hashCode ^
        Temperature.hashCode ^
        Timestamp.hashCode;
  }
}
