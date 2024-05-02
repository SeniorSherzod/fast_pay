class UserModel {
  final String username;
  final String password;
  final String lastname;
  final String email;
  final String image;
  final String phoneNumber;
  final String userId;

  UserModel(
      {required this.image,
      required this.userId,
      required this.lastname,
      required this.username,
      required this.password,
      required this.email,
      required this.phoneNumber});

  UserModel copyWith({
    String? username,
    String? password,
    String? lastname,
    String? email,
    String? image,
    String? phoneNumber,
    String? userId,
  }) {
    return UserModel(
        image: image ?? this.image,
        userId: userId ?? this.userId,
        lastname: lastname ?? this.lastname,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber);
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "lastname": lastname,
        "username": username,
        "image": image,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        image: json["image"] as String? ?? "",
        userId: json["image"] as String? ?? "",
        lastname: json["lastname"] as String? ?? "",
        username: json["username"] as String? ?? "",
        password: json["password"] as String? ?? "",
        email: json["email"] as String? ?? "",
        phoneNumber: json["phoneNumber"] as String? ?? "");
  }

  static UserModel initial() => UserModel(
      image: "",
      userId: "",
      lastname: "",
      username: "",
      password: "",
      email: "",
      phoneNumber: "");
}
