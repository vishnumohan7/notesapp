class UserModel {
    String? id;
  final String? name;
  final String email;
  final String password;
  final String? address;
  final String? mobNo;

  UserModel(
      { this.id,
         this.name,
      required this.email,
      required this.password,
       this.address,
       this.mobNo});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
      address: json["address"],
      mobNo: json["mobNo"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "address": this.address,
      "mobNo": this.mobNo,
    };
  }
//

}
