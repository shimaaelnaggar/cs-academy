class CourseModel {
  String id;
  String title;
  String desc;
  num price;
  String img;
  CourseModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.price,
    required this.img,
  });

  factory CourseModel.fromJson(Map<String, dynamic> data) {
    return CourseModel(
      id: data['id'].toString(),
      title: data['title'] ?? '',
      desc: data['desc'] ?? '',
      price: data['price'] ?? 0,
      img: data['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'price': price,
      'image': img,
    };
  }
}
