import 'package:cloud_firestore/cloud_firestore.dart';

class VideoInfoModal {
  final String time;
  final String thumbnailUrl;
  final String videoUrl;
  final String title;

  VideoInfoModal({
    required this.time,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.title,
  });

  factory VideoInfoModal.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return VideoInfoModal(
      time: data['time'] ?? '',
      thumbnailUrl: data['thumbnailUrl'] ?? '',
      videoUrl: data['videoUrl'] ?? '',
      title: data['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'thumbnailUrl': thumbnailUrl,
      'videoUrl': videoUrl,
      'title': title,
    };
  }
}
