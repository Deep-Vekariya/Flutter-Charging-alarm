// import 'dart:async';

import 'package:charging_alarm/app/modules/charging_alarm/views/charging_alarm_view.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// final FlutterLocalNotificationsPlugin flutterLocalPlugin =
//     FlutterLocalNotificationsPlugin();
// const AndroidNotificationChannel notificationChannel =
//     AndroidNotificationChannel(
//   "coading is life foreground",
//   "coading is life foreground servide",
//   description: 'This is chennal dse..',
//   importance: Importance.high,
// );
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initservice();
  runApp(const MyApp());
}

// // initservice function
// Future<void> initservice() async {
//   var service = FlutterBackgroundService();
//   await service.configure(
//     iosConfiguration: IosConfiguration(),
//     androidConfiguration: AndroidConfiguration(
//       onStart: onStart,
//       autoStart: true,
//       isForegroundMode: true,
//       notificationChannelId: 'coding is life',
//       initialNotificationTitle: 'Coding is life',
//       initialNotificationContent: 'Awsom, Content',
//       foregroundServiceNotificationId: 90,
//     ),
//   );
//   service.startService();
// }

// // onstart method
// @pragma("vm:entry-point")
// void onStart(ServiceInstance service) {
//   service.on("setAsForeground").listen(
//     (event) {
//       print('foreground ========================');
//     },
//   );

//   service.on("setAsBackground").listen(
//     (event) {
//       print('Background ========================');
//     },
//   );

//   service.on("stopService").listen(
//     (event) {
//       service.stopSelf();
//     },
//   );

//   // display notification as service
//   Timer.periodic(
//     const Duration(seconds: 2),
//     (timer) {
//       flutterLocalPlugin.show(
//         90,
//         "Cool Services",
//         'Awsome ${DateTime.now()}',
//         const NotificationDetails(
//           android: AndroidNotificationDetails(
//             'coding is life',
//             'coding is life service',
//             ongoing: true,
//             icon: 'app_icon',
//           ),
//         ),
//       );
//     },
//   );

//   print('Background service ${DateTime.now()}');
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChargingAlarmView(),
    );
  }
}
