import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mountainsquad_app/dependency_injection/init_locator.dart';
import 'package:mountainsquad_app/frontend/screens/navigation/widget/navigation_detail_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Example App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
      ),
      initialBinding: InitialScreenBinding(),
      home: NavigationDetailScreen(),
    );
  }
}
