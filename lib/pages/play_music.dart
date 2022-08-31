import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayMusicPage extends StatelessWidget {
  const PlayMusicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
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
          )
        ],
      )),
    );
  }
}
