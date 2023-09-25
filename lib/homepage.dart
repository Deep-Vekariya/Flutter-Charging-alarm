import 'package:audioplayers/audioplayers.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> getStatus() async {
    BatteryInfoPlugin()
        .androidBatteryInfoStream
        .listen((AndroidBatteryInfo? batteryInfo) {
      setState(() {
        chargingStatus = batteryInfo!.chargingStatus.toString().split(".")[1];
        batterylevel = batteryInfo.batteryLevel!;
        batterypresent = batteryInfo.present!;
      });
      playAudio();
    });
  }

  final audioPlayer = AudioPlayer();

  var chargingStatus = '';
  int batterylevel = 1;
  bool batterypresent = false;

  void playAudio() {
    if (chargingStatus != 'Discharging') {
      if (batterylevel > 85) {
        audioPlayer.play(AssetSource('msindia.mp3'));
      }
    }
  }

  @override
  void initState() {
    getStatus();
    // playAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Charging Status: $chargingStatus'),
            Text('Battery Level: $batterylevel'),
            Text('Present Battery: $batterypresent'),
            ElevatedButton(
              onPressed: () {
                audioPlayer.play(
                  AssetSource('msindia.mp3'),
                );
              },
              child: const Text('Play'),
            ),
            ElevatedButton(
              onPressed: () {
                audioPlayer.stop();
              },
              child: const Text('stop'),
            )

            // log('Charging Status is: $chargingStatus')
          ],
        ),
      ),
    );
  }
}
