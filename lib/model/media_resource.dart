class MediaResource {
  final String id;
  final String imageUrl;

  const MediaResource({
    required this.id,
    required this.imageUrl,
  });

  factory MediaResource.fromJson(Map<String, dynamic> json) {
    return MediaResource(
        id: json['id'],
        imageUrl: json['imageUrl']
    );
  }
}