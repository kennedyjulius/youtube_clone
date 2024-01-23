import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:youtube_clone/model/video_modal.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String videosCollection =
      'videosCollection'; // Replace with your collection name

  Future<List<VideoInfoModal>> getVideos() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection(videosCollection).get();

      List<VideoInfoModal> videos = querySnapshot.docs
          .map((doc) => VideoInfoModal.fromFirestore(doc))
          .toList();

      return videos;
    } catch (e) {
      print('Error fetching videos: $e');
      throw Exception('Failed to fetch videos');
    }
  }

  Stream<List<VideoInfoModal>> getVideosStream() {
    try {
      Stream<QuerySnapshot> stream =
          _firestore.collection(videosCollection).snapshots();

      return stream.map((querySnapshot) {
        return querySnapshot.docs
            .map((doc) => VideoInfoModal.fromFirestore(doc))
            .toList();
      });
    } catch (e) {
      Get.snackbar("Error Loading", "$e");
      throw Exception('Failed to stream videos');
    }
  }
}
