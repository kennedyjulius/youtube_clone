import 'package:get/get.dart';

class MiniPlayerController extends GetxController {
  final RxBool isMiniPlayerOpen = false.obs;
  final RxString currentVideoUrl = "video.url".obs;

  void openMiniPlayer(String videoUrl) {
    isMiniPlayerOpen.value = true;
    currentVideoUrl.value = videoUrl;
  }

  void closeMiniPlayer() {
    isMiniPlayerOpen.value = false;
    currentVideoUrl.value = '';
  }
}
