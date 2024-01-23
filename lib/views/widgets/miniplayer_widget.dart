// import 'package:flutter/material.dart';

// class MiniPlayer extends StatelessWidget {
//   final String videoUrl;

//   MiniPlayer({required this.videoUrl});

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     return Container(
//       height: 60,
//       color: Colors.black,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Miniplayer controls, video thumbnail, etc.

//           Container(
//             child: Image.network(
//               'https://example.com/video_thumbnail.jpg',
//               width: 100,
//               height: h*0.25,
//               fit: BoxFit.cover,
//             ),
//           ),

//           Flexible(
//             child: Column(
//               children: [
//                 Text(
//                   'Video Title',
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(
//                   height: 6,
//                 ),
//                 Text(
//                   'Video Title',
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),

//           // Add play/pause, skip buttons, etc. based on your requirements
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.play_arrow,
//                 size: 24,
//                 color: Colors.white,
//               )),
//           SizedBox(
//             width: 10,
//           ),
//           Icon(
//             Icons.clear,
//             size: 24,
//             color: Colors.white,
//           )
//         ],
//       ),
//     );
//   }
// }
