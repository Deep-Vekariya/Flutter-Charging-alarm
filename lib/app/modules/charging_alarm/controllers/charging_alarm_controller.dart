import 'package:audioplayers/audioplayers.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargingAlarmController extends GetxController {
  final audioPlayer = AudioPlayer();
  var chargingStatus = ''.obs;
  var batterylevel = 99.obs;
  var batterypresent = false.obs;
  final batterylavelcontroller = TextEditingController();
  var setChargingLimit = 80.obs;

  // @override
  // void onInit() {
  //   getBatteryDetails();
  //   super.onInit();
  // }

  @override
  void dispose() {
    batterylavelcontroller.dispose();
    super.dispose();
  }

  Future<void> getBatteryDetails() async {
    BatteryInfoPlugin()
        .androidBatteryInfoStream
        .listen((AndroidBatteryInfo? batteryInfo) {
      chargingStatus.value =
          batteryInfo!.chargingStatus.toString().split(".")[1].toString();
      Get.log("Charging Status: ${chargingStatus.value.toString()}");
      batterylevel.value = batteryInfo.batteryLevel!;
      Get.log("Battery level: ${batterylevel.value.toString()}");
      batterypresent.value = batteryInfo.present!;
      Get.log("Battery Present: ${batterypresent.value.toString()}");

      if (chargingStatus.value != 'Discharge') {
        if (batterylevel > setChargingLimit.value) {
          playMusic();
          Get.log("---------------------------111------");
        }
        else {
          pauseMusic();
          Get.log("---------------------------222------");
        }
      }
    });
  }

  void playMusic() {
    if (chargingStatus.value != 'Discharging') {
      if (batterylevel.value > setChargingLimit.value) {
        audioPlayer.play(AssetSource('msindia.mp3'));
      }
    }
  }

  void pauseMusic() {
    audioPlayer.pause();
  }

  void stopMusic() {
    audioPlayer.stop();
  }
}
