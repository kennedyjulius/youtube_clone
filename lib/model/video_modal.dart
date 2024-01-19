class VideoInfoModal {
  final String title;
  final String description;
  final String videoUrl;

  VideoInfoModal({
    required this.title,
    required this.description,
    required this.videoUrl,
  });

  // Method to convert the object to a map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'videoUrl': videoUrl,
    };
  }

  // Factory method to create an object from a map
  factory VideoInfoModal.fromMap(Map<String, dynamic> map) {
    return VideoInfoModal(
      title: map['title'],
      description: map['description'],
      videoUrl: map['videoUrl'],
    );
  }

  // Override toString for easier debugging
  @override
  String toString() {
    return 'VideoInfoModal{title: $title, description: $description, videoUrl: $videoUrl}';
  }
}
