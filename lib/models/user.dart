class User {
  User({this.id, this.email, this.password, this.name, this.profilePicture});
  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    password = json["password"];
    name = json["name"];
    profilePicture = json["profile_picture"];
  }
  int? id;
  String? email;
  String? password;
  String? name;
  String? profilePicture;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["email"] = email;
    data["password"] = password;
    data["name"] = name;
    data["profile_picture"] = profilePicture;
    return data;
  }
}
