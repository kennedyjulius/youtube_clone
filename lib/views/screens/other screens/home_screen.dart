import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/controllers/miniplayer_controller.dart';
import 'package:youtube_clone/model/video_modal.dart';
import 'package:youtube_clone/services/firebase_services.dart';
import 'package:youtube_clone/views/widgets/custom_sliver_appbar.dart';
import 'package:youtube_clone/views/widgets/video_card.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseService _firebaseService = FirebaseService();
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MiniPlayerController miniPlayerController =
      Get.put(MiniPlayerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          StreamBuilder<List<VideoInfoModal>>(
            stream: widget._firebaseService.getVideosStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text('Error: ${snapshot.error}'),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text('No videos available.'),
                  ),
                );
              } else {
                List<VideoInfoModal> videos = snapshot.data!;
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return VideoCard(videoUrl: videos[index].videoUrl);
                    },
                    childCount: videos.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: Obx(() {
        //show the miniplayer based on state
        return miniPlayerController.isMiniPlayerOpen.value
            ? const Miniplayer("videoUrl: miniPlayerController.currentVideoUrl.value")
            : SizedBox.shrink();
      }),
    );
  }
}
