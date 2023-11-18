class Onboard {
  String? image;
  String? name;
  String? title;

  Onboard({this.image, this.name, this.title});

  Onboard.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['title'] = title;
    return data;
  }
}
