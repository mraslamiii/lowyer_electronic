class User {
  int? id = -1;
  String? firstName = "";
  String? lastName = " ";
  String? phoneNumber = "";
  String? national_code = "";
  String? fatherName = "";
  String? zipCode = "";
  String? address = "";
  int? lawyerProfile ;

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
    this.fatherName,
    this.zipCode,
    this.address,
    this.lawyerProfile,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['mobile_number'];
    isDeactive = json['isDeactive'];
    national_code = json['national_code'];
    fatherName = json['father_name'];
    zipCode = json['code_at'];
    address = json['address'];
    lawyerProfile = json['lawyer_profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['is_deactive'] = isDeactive;
    data['national_code'] = national_code;
    data['father_name'] = fatherName;
    data['code_at'] = zipCode;
    data['address'] = address;
    data['lawyer_profile'] = lawyerProfile;
    return data;
  }
}
