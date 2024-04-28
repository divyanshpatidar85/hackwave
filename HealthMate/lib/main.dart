import 'package:camera/camera.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:health_mate/Screens/spleshScreen.dart';
import 'package:health_mate/provider/provider.dart';
import 'package:health_mate/video-calling/all-slot.dart';
import 'package:health_mate/video-calling/constutant-features.dart';
import 'package:provider/provider.dart';
import 'Notification Services/notifications.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timezone/data/latest.dart' as tz;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}

List<CameraDescription>? cameras;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras=await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  tz.initializeTimeZones();
  await LocalNotifications.init();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         primarySwatch: Colors.deepPurple,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple,width: 1.5),
                borderRadius: BorderRadius.circular(8)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black,width: 1.5),
                borderRadius: BorderRadius.circular(8)
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black,width: 1.5),
                borderRadius: BorderRadius.circular(8)
            ),

          ),
        ),

        home:const ConsultantInformation(),

      ),
    );
  }
}



