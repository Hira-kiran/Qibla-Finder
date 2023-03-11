import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Theme/theme.dart';
import 'appScreens/qibla_finder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasPermission = false;
  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      title: 'Qibla Finder',
      home: FutureBuilder(
        builder: (context, snapshot) {
          if (hasPermission) {
            return QiblaFinder();
          } else {
            return Scaffold(
              backgroundColor: Colors.green,
            );
          }
        },
        future: getPermission(),
      ),
    );
  }
}
