class EditEducationRQM {
  String? firstName;
  String? lastName;
  String? fatherName;
  String? education;
  String? academicDiscipline;
  String? educationPlace;
  String? nationalCode;
  String? _method;
  String? address;
  String? postalCode;

  EditEducationRQM({
    this.firstName,
    this.lastName,
    this.fatherName,
    this.education,
    this.academicDiscipline,
    this.educationPlace,
    this.nationalCode,
    this.address,
    this.postalCode,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['father_name'] = fatherName;
    data['education'] = education;
    data['academic_discipline'] = academicDiscipline;
    data['education_place'] = educationPlace;
    data['_method'] = 'patch';
    data['national_code'] = nationalCode;
    data['address'] = address;
    data['postal_code'] = postalCode;
    return data;
  }
}
