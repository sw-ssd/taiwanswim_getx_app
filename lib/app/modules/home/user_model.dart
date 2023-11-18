class User {
  String? name;
  String? image;
  String? email;
  String? phoneNo;

  User({this.name, this.image, this.email, this.phoneNo});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    email = json['email'];
    phoneNo = json['phoneNo'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['email'] = email;
    data['phoneNo'] = phoneNo;
    return data;
  }
}
