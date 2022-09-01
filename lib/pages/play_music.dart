import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/home_controller.dart';
import 'package:music_app/controllers/play_music_controller.dart';

class PlayMusicPage extends StatelessWidget {
  PlayMusicPage({Key? key}) : super(key: key);
  PlayMusicController playMusicController = Get.put(PlayMusicController());
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        playMusicController.player.value.dispose();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
            child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      playMusicController.player.value.dispose();
                      Get.back();
                    },
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  Text(
                    "Playing Now",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 24,
                    width: 24,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Hero(
                  tag: "image${homeController.currentIndex.value}",
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/${homeController.playlists[homeController.currentIndex.value][3]}",
                        width: MediaQuery.of(context).size.width,
                        height: 220,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  homeController.playlists[homeController.currentIndex.value][1],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  homeController.playlists[homeController.currentIndex.value][0],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  homeController.playlists[homeController.currentIndex.value][4],
                  style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.6)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Slider(
                activeColor: Color(0XFF940CFF),
                value: playMusicController.currentPosition.value.toDouble(),
                label: playMusicController.formatDuration(playMusicController.currentPosition.value),
                max: playMusicController.duration.toDouble(),
                divisions: playMusicController.duration.value == 0 ? 100 : playMusicController.duration.value,
                onChanged: (value) {
                  playMusicController.currentPosition.value = value.toInt();
                  playMusicController.onChange(value.toInt());
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        playMusicController.formatDuration(playMusicController.currentPosition.value),
                        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),
                      ),
                      Text(
                        playMusicController.formatDuration(playMusicController.duration.value),
                        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(color: Color(0XFF222230), shape: BoxShape.circle),
                    child: Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      playMusicController.previousSong();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(color: Color(0XFF222230), shape: BoxShape.circle),
                      child: Icon(
                        Icons.keyboard_double_arrow_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (playMusicController.isPlay.value) {
                        playMusicController.pause();
                      } else {
                        playMusicController.play();
                      }
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(color: Color(0XFF940CFF), shape: BoxShape.circle),
                      child: Icon(
                        playMusicController.isPlay.value ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      playMusicController.nextSong();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(color: Color(0XFF222230), shape: BoxShape.circle),
                      child: Icon(
                        Icons.keyboard_double_arrow_right,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(color: Color(0XFF222230), shape: BoxShape.circle),
                    child: Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
