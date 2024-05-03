class UserModel {
  final String username;
  final String password;
  final String lastname;
  final String email;
  final String image;
  final String phoneNumber;
  final String userId;
  final String authId;
  final String fsm;

  UserModel(
      {required this.image,
      required this.userId,
      required this.lastname,
      required this.username,
      required this.password,
      required this.email,
      required this.phoneNumber,
      required this.fsm,
        required this.authId
      });

  UserModel copyWith({
    String? username,
    String? password,
    String? lastname,
    String? email,
    String? image,
    String? phoneNumber,
    String? userId,
    String? authId,
    String? fsm,
  }) {
    return UserModel(
        image: image ?? this.image,
        userId: userId ?? this.userId,
        lastname: lastname ?? this.lastname,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        authId: authId ?? this.authId,
        fsm: fsm ?? this.fsm);
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "lastname": lastname,
        "username": username,
        "image": image,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "fsm": fsm,
        "authId": authId
      };

  Map<String, dynamic> toJsonForUpdate() => {
    "userId": userId,
    "lastname": lastname,
    "username": username,
    "image": image,
    "email": email,
    "password": password,
    "phoneNumber": phoneNumber,
    "fsm": fsm,
    "authId": authId
  };
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        image: json["image"] as String? ?? "",
        userId: json["image"] as String? ?? "",
        lastname: json["lastname"] as String? ?? "",
        username: json["username"] as String? ?? "",
        password: json["password"] as String? ?? "",
        email: json["email"] as String? ?? "",
        phoneNumber: json["phoneNumber"] as String? ?? "",
        authId: json["authId"] as String? ?? "",
        fsm: json["fsm"] as String? ?? "");
  }

  static UserModel initial() => UserModel(
      image: "",
      userId: "",
      lastname: "",
      username: "",
      password: "",
      email: "",
      fsm: "",
      authId: "",
      phoneNumber: "");
}
