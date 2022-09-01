import 'package:get/get.dart';

class HomeController extends GetxController {
  var albums = [
    ["AKMU", "Play", "Akmu.jpg"],
    ["Bolbbalgan 4", "Red Planet", "Bol4.jpg"],
    ["IU", "Lilac", "IU.png"]
  ];
  var playlists = [
    ["AKMU", "Dinosaur", "AKMU-Dinosaur.mp3", "AKMU - Dinosaur.jpg", "Play"],
    ["Bolbbalgan 4", "Some", "Bolbbalgan4-Some.mp3", "BOL4 - some.jfif", "Red Planet"],
    ["IU", "Coin", "IU-Coin.mp3", "IU - Coin.jpg", "Lilac"]
  ].obs;
  var currentIndex = 0.obs;
}
