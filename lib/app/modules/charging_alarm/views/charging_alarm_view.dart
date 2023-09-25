import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/charging_alarm_controller.dart';

class ChargingAlarmView extends StatelessWidget {
  const ChargingAlarmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChargingAlarmController());

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.batterylavelcontroller,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                controller.setChargingLimit.value =
                    int.parse(controller.batterylavelcontroller.text);
                controller.getBatteryDetails();
              },
              child: const Text('start'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.stopMusic();
              },
              child: const Text('stop'),
            )
          ],
        ),
      ),
    );
  }
}
