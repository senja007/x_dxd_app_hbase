import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';

class MonitoringController extends GetxController {
  //TODO: Implement MenuMonitoringController
  var ammonia = '12.5 ppm'.obs;
  var windSpeed = '5 m/s'.obs;
  var humidity = '65%'.obs;
  var cuaca = '23℃\nlebih dingin'.obs;
  late VideoPlayerController videoPlayerController;

  String videoUrl =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((value) => (() {}));
    videoPlayerController.initialize();
    ammonia.value;
    windSpeed.value;
    humidity.value;
    cuaca.value;

//     videoPlayerController = VideoPlayerController.network(
//   'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
// )..initialize().then((_) {
//   videoPlayerController.play();
//   update();
// });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // Pastikan untuk melepas sumber daya video saat widget dihapus
    // videoPlayerController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
