class User {
  late String nationalCode;
  late String firstName;
  late String lastName;
  late String mobileNumber;
  late String updatedAt;
  late String createdAt;
  int? id;

  User(
      {required this.nationalCode,
      required this.firstName,
      required this.lastName,
      required this.mobileNumber,
      required this.updatedAt,
      required this.createdAt,
      required this.id});

  User.fromJson(Map<String, dynamic> json) {
    nationalCode = json['national_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNumber = json['mobile_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['national_code'] = nationalCode;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile_number'] = mobileNumber;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
