class VideoModel {
  final String title;
  final String id;
  final String desc;
  final String url;
  final String image;

  VideoModel({
    required this.title,
    required this.id,
    required this.desc,
    required this.url,
    required this.image,
  });

  factory VideoModel.fromJson(Map<String, dynamic> data) {
    return VideoModel(
      title: data['title'],
      id: data['id'],
      desc: data['desc'],
      url: data['video_url'],
      image: data['image'],
    );
  }
}
