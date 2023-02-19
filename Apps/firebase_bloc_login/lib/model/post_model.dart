class Post {
  String? id;
  String? desc;
  String? image;

Post({required this.id,required this.desc,required this.image});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    desc = json['desc'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['desc'] = desc;
    data['image'] = image;
    return data;
  }
}
