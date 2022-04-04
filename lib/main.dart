import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/screens/home/home_screen.dart';
import 'package:rick_and_morty/screens/photo/photo_screen.dart';
import 'package:rick_and_morty/locator.dart';
import 'package:rick_and_morty/services/inner_storage/inner_storage_service_interface.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  await locator.get<InnerStorageServiceInterface>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/photoScreen', page: () => PhotoScreen()),
      ],
      title: 'Rick And Morty',
      theme: ThemeData(
        primaryColor: Colors.amber,
        appBarTheme: AppBarTheme(backgroundColor: Colors.amber)
      ),
      initialRoute: '/',
    );
  }
}
