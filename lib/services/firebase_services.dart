import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_clone/model/video_modal.dart';

class FirebaseService {
  final CollectionReference videosCollection =
      FirebaseFirestore.instance.collection('videos');

  Future<void> addVideoInfo(VideoInfoModal videoInfo) async {
    await videosCollection.add(videoInfo.toMap());
  }

  Stream<List<VideoInfoModal>> getVideosStream() {
    return videosCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return VideoInfoModal.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
