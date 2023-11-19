class Member {
  String? name;
  String? image;
  String? email;
  String? phoneNo;

  Member({this.name, this.image, this.email, this.phoneNo});

  Member.fromJson(Map<String, dynamic> json) {
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
