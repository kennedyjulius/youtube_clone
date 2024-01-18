import 'package:flutter/material.dart';
import 'package:youtube_clone/views/widgets/video_player_widget.dart';

class VideoCard extends StatelessWidget {
  final String videoUrl;
  const VideoCard({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16/9,
              child: VideoPlayerWidget(videoUrl: videoUrl),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Video Title", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.white),
                ),
                ),
          ],
        ),
      ),
    );
  }
}
