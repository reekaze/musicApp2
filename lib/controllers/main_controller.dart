import 'package:get/get.dart';
import 'package:music_app/pages/album.dart';
import 'package:music_app/pages/favourite.dart';
import 'package:music_app/pages/home.dart';
import 'package:music_app/pages/settings.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;
  var pages = [HomePage(), AlbumPage(), FavouritePage(), SettingsPage()];
}
