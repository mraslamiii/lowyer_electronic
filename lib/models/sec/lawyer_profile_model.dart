import 'package:kanoon_dadgostari/models/sec/user_model.dart';

import '../base/safe_convert.dart';

class   LawyerProfileModel {
  final User? user;
  final String education;
  final String academicDiscipline;
  final String educationPlace;
  final String licenseNumber;
  final String licenseCreateDate;
  final String licenseExpireDate;
  final String cityName;
  final String addressOffice;
  final String TellOffice;
  final String lat;
  final String long;
  final String instagram;
  final String whatsApp;
  final String webSite;
  final String nationalCardPicFront;
  final String nationalCardPicBack;
  final String birthCertificatePic;
  final String licensePic;
  final String status;

  LawyerProfileModel({
    this.user,
    this.education = "",
    this.academicDiscipline = "",
    this.educationPlace = "",
    this.licenseNumber = "",
    this.licenseCreateDate = "",
    this.licenseExpireDate = "",
    this.cityName = "",
    this.addressOffice = "",
    this.TellOffice = "",
    this.lat = "",
    this.long = "",
    this.instagram = "",
    this.whatsApp = "",
    this.webSite = "",
    this.nationalCardPicFront = "",
    this.nationalCardPicBack = "",
    this.birthCertificatePic = "",
    this.licensePic = "",
    this.status = "",
  });

  factory LawyerProfileModel.fromJson(Map<String, dynamic>? json) => LawyerProfileModel(
    user: User.fromJson(asT<Map<String, dynamic>>(json, 'user')),
    education: asT<String>(json, 'education'),
    academicDiscipline: asT<String>(json, 'academic_discipline'),
    educationPlace: asT<String>(json, 'education_place'),
    licenseNumber: asT<String>(json, 'license_number'),
    licenseCreateDate: asT<String>(json, 'license_create_date'),
    licenseExpireDate: asT<String>(json, 'license_expire_date'),
    cityName: asT<String>(json, 'city_name'),
    addressOffice: asT<String>(json, 'address_office'),
    TellOffice: asT<String>(json, 'Tell_office'),
    lat: asT<String>(json, 'lat'),
    long: asT<String>(json, 'long'),
    instagram: asT<String>(json, 'instagram'),
    whatsApp: asT<String>(json, 'whats_app'),
    webSite: asT<String>(json, 'web_site'),
    nationalCardPicFront: asT<String>(json, 'national_card_pic_front'),
    nationalCardPicBack: asT<String>(json, 'national_card_pic_back'),
    birthCertificatePic: asT<String>(json, 'birth_certificate_pic'),
    licensePic: asT<String>(json, 'license_pic'),
    status: asT<String>(json, 'status'),
  );

  Map<String, dynamic> toJson() => {
    'user': user?.toJson(),
    'education': education,
    'academic_discipline': academicDiscipline,
    'education_place': educationPlace,
    'license_number': licenseNumber,
    'license_create_date': licenseCreateDate,
    'license_expire_date': licenseExpireDate,
    'city_name': cityName,
    'address_office': addressOffice,
    'Tell_office': TellOffice,
    'lat': lat,
    'long': long,
    'instagram': instagram,
    'whats_app': whatsApp,
    'web_site': webSite,
    'national_card_pic_front': nationalCardPicFront,
    'national_card_pic_back': nationalCardPicBack,
    'birth_certificate_pic': birthCertificatePic,
    'license_pic': licensePic,
    'status': status,
  };
}