import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/main_controller.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Color(0XFF940CFF),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultPage(),
    );
  }
}

class DefaultPage extends StatelessWidget {
  DefaultPage({Key? key}) : super(key: key);
  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => mainController.pages[mainController.currentIndex.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: mainController.currentIndex.value,
            items: [
              BottomNavigationBarItem(icon: mainController.currentIndex.value == 0 ? Icon(Icons.home) : Icon(Icons.home_outlined), label: ""),
              BottomNavigationBarItem(icon: mainController.currentIndex.value == 1 ? Icon(Icons.album) : Icon(Icons.album_outlined), label: ""),
              BottomNavigationBarItem(icon: mainController.currentIndex.value == 2 ? Icon(Icons.favorite) : Icon(Icons.favorite_outline), label: ""),
              BottomNavigationBarItem(icon: mainController.currentIndex.value == 3 ? Icon(Icons.settings) : Icon(Icons.settings_outlined), label: ""),
            ],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Color(0XFF940CFF),
            unselectedItemColor: Color(0XFFAAAAAA),
            backgroundColor: Color(0XFF191626),
            onTap: (value) => mainController.currentIndex.value = value,
          ),
        ),
      ),
    );
  }
}
