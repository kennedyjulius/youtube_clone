import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoCard extends StatelessWidget {
  final String videoUrl;
  const VideoCard({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              "//video.thumbnailUrl,",
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "//description of the video",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Get.to("//Profile Screen");
                  },
                  icon: CircleAvatar(
                    radius: 42,
                    backgroundImage: NetworkImage("//network image "),
                  ),
                ),
                SizedBox(height: 5,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(child: Text("//video.title",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      )
                      ),
                      // Flexible(child: Text("${video.author.username} . ${video.viewCount} views . ${timeago.format(video.timestamp).timestamp}",
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      // ),
                      // ),
                    ],
                  ),
                ),
                IconButton(onPressed: () {
                  
                }, icon: Icon(Icons.more_vert, size: 20,)),
              ],
            )
          ],
        )
      ],
    );
  }
}
