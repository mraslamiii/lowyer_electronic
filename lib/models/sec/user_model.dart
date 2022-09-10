class User {
  int? id = -1;
  String? firstName = "";
  String? lastName = " ";
  String? phoneNumber = "";
  String? national_code = "";

  // late String roles;
  bool? isDeactive = false;

  // late String permissions;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.isDeactive,
    this.national_code,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['mobile_number'];
    isDeactive = json['isDeactive'];
    national_code = json['national_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['isDeactive'] = isDeactive;
    data['national_code'] = national_code;
    return data;
  }
}
