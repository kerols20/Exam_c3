class ProfileModel {
  String? name;
  String? email;
  String? phone;
  String? username;
  String? password;

  ProfileModel({this.name, this.email, this.phone, this.username, this.password});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
    };
  }
}