import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/controllers/home_controller.dart';

class PlayMusicController extends GetxController {
  var player = AudioPlayer().obs;
  var duration = 0.obs;
  var isPlay = false.obs;
  var currentPosition = 0.obs;

  HomeController homeController = Get.find();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await player.value.setAsset("assets/musics/${homeController.playlists[homeController.currentIndex.value][2]}");
    duration.value = player.value.duration!.inSeconds;
    player.value.positionStream.listen((event) {
      currentPosition.value = player.value.position.inSeconds;
    });
    player.value.playerStateStream.listen(
      (event) {
        if (event.processingState == ProcessingState.completed) {
          nextSong();
        }
      },
    );
  }

  formatDuration(int value) {
    int minutes = (value / 60).floor();
    int seconds = value % 60;
    return "${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, "0")}";
  }

  play() {
    isPlay.value = true;
    player.value.play();
  }

  pause() {
    isPlay.value = false;
    player.value.pause();
  }

  onChange(int value) {
    player.value.seek(Duration(seconds: value));
  }

  stop() {
    isPlay.value = false;
    player.value.stop();
  }

  nextSong() async {
    if (homeController.currentIndex.value == homeController.playlists.length - 1) {
      homeController.currentIndex.value = 0;
    } else {
      homeController.currentIndex.value += 1;
    }
    await refreshPlayer();
  }

  previousSong() async {
    if (homeController.currentIndex.value == 0) {
      homeController.currentIndex.value = homeController.playlists.length - 1;
    } else {
      homeController.currentIndex.value -= 1;
    }
    await refreshPlayer();
  }

  refreshPlayer() async {
    await player.value.setAsset("assets/musics/${homeController.playlists[homeController.currentIndex.value][2]}");
    duration.value = player.value.duration!.inSeconds;
    currentPosition.value = 0;
    play();
  }
}
