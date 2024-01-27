import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_clone/model/video_modal.dart';

class VideoCard extends StatelessWidget {

  final data;

  const VideoCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              data['thumbnailUrl'],
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
                  "dummy text description",
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    // You can navigate to the profile screen here
                    // using Get.to("//Profile Screen");
                  },
                  icon: CircleAvatar(
                    radius: 42,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1682685797332-e678a04f8a64?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8",
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          data['title'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Add other UI components like author name, view count, and timestamp here
                      // Flexible(
                      //   child: Text(
                      //     "${videoInfo.author.username} . ${videoInfo.viewCount} views . ${timeago.format(videoInfo.timestamp).timestamp}",
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Add functionality for more options
                  },
                  icon: Icon(
                    Icons.more_vert,
                    size: 20,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
