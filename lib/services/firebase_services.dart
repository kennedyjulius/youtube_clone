import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_clone/model/video_modal.dart';

class FirebaseService {
  final CollectionReference videosCollection =
      FirebaseFirestore.instance.collection('videos');

  Future<void> addVideoInfo() async {

  

    VideoInfoModal video = VideoInfoModal(
      title: "Movie",
      description: "This is a Spiderman Movie",
      videoUrl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    );

    await videosCollection.add(video.toMap());
  }

  Stream<List<VideoInfoModal>> getVideosStream() {
    return videosCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return VideoInfoModal.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
