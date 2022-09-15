import 'package:kanoon_dadgostari/models/entity/infoProfileEntity.dart';

import '../base/safe_convert.dart';

class InfoProfileModel extends InfoProfileEntity {
  InfoProfileModel({
    int? statusCode,
    bool? success,
    LawyerData? data,
  }) : super(data: data, statusCode: statusCode, success: success);

  factory InfoProfileModel.fromJson(Map<String, dynamic>? json) =>
      InfoProfileModel(
        statusCode: asT<int>(json, 'statusCode'),
        success: asT<bool>(json, 'success'),
        data: LawyerData.fromJson(asT<Map<String, dynamic>>(json, 'data')),
      );

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'success': success,
        'data': data!.toJson(),
      };

  factory InfoProfileModel.fromEntity(final InfoProfileEntity item) {
    return InfoProfileModel(
        data: item.data, success: item.success, statusCode: item.statusCode);
  }
}

class LawyerData {
  final User? user;
  final Profile? profile;
  final Cards? cards;

  LawyerData({
    this.user,
    this.profile,
    this.cards,
  });

  factory LawyerData.fromJson(Map<String, dynamic>? json) => LawyerData(
        user: User.fromJson(asT<Map<String, dynamic>>(json, 'user')),
        profile: Profile.fromJson(asT<Map<String, dynamic>>(json, 'profile')),
        cards: Cards.fromJson(asT<Map<String, dynamic>>(json, 'cards')),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'profile': profile?.toJson(),
        'cards': cards?.toJson(),
      };
}

class User {
  final int id;
  String firstName;
  String lastName;
  String mobileNumber;
  String postalCode;
  String code;
  String codeAt;
  String fatherName;
  String nationalCode;
  String dateOfBirth;
  String address;
  String phoneNumber;
  String alive;
  String avatar;
  String status;
  String description;
  String createUserId;
  String updateUserId;
  String createdAt;
  String updatedAt;
  int? lawyerProfile;

  User({
    this.id = 0,
    this.firstName = "",
    this.lastName = "",
    this.mobileNumber = "",
    this.postalCode = '',
    this.code = "",
    this.codeAt = '',
    this.fatherName = "",
    this.nationalCode = "",
    this.dateOfBirth = '',
    this.address = "",
    this.phoneNumber = '',
    this.alive = "",
    this.avatar = '',
    this.status = "",
    this.description = "",
    this.createUserId = '',
    this.updateUserId = '',
    this.createdAt = "",
    this.updatedAt = "",
    this.lawyerProfile,
  });

  factory User.fromJson(Map<String, dynamic>? json) => User(
        id: asT<int>(json, 'id'),
        firstName: asT<String>(json, 'first_name'),
        lastName: asT<String>(json, 'last_name'),
        mobileNumber: asT<String>(json, 'mobile_number'),
        postalCode: asT<String>(json, 'postal_code'),
        code: asT<String>(json, 'code'),
        codeAt: asT<String>(json, 'code_at'),
        fatherName: asT<String>(json, 'father_name'),
        nationalCode: asT<String>(json, 'national_code'),
        dateOfBirth: asT<String>(json, 'date_of_birth'),
        address: asT<String>(json, 'address'),
        phoneNumber: asT<String>(json, 'phone_number'),
        alive: asT<String>(json, 'alive'),
        avatar: asT<String>(json, 'avatar'),
        status: asT<String>(json, 'status'),
        description: asT<String>(json, 'description'),
        createUserId: asT<String>(json, 'create_user_id'),
        updateUserId: asT<String>(json, 'update_user_id'),
        createdAt: asT<String>(json, 'created_at'),
        updatedAt: asT<String>(json, 'updated_at'),
        lawyerProfile: asT<int>(json, 'lawyer_profile'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'mobile_number': mobileNumber,
        'postal_code': postalCode,
        'code': code,
        'code_at': codeAt,
        'father_name': fatherName,
        'national_code': nationalCode,
        'date_of_birth': dateOfBirth,
        'address': address,
        'phone_number': phoneNumber,
        'alive': alive,
        'avatar': avatar,
        'status': status,
        'description': description,
        'create_user_id': createUserId,
        'update_user_id': updateUserId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'lawyer_profile': lawyerProfile,
      };
}

class Profile {
  final int id;
  final String userId;
  final String education;
  final String academicDiscipline;
  final String educationPlace;
  final String licenseNumber;
  final String licenseCreateDate;
  final String licenseExpireDate;
  final String cityName;
  final String addressOffice;
  final String tellOffice;
  final String lat;
  final String long;
  final String isIntern;
  final String instagram;
  final String whatsApp;
  final String webSite;
  final String nationalCardPicFront;
  final String nationalCardPicBack;
  final String birthCertificatePic;
  final String licensePic;
  final String status;
  final String createdAt;
  final String updatedAt;

  Profile({
    this.id = 0,
    this.userId = "",
    this.education = '',
    this.academicDiscipline = '',
    this.educationPlace = '',
    this.licenseNumber = "",
    this.licenseCreateDate = "",
    this.licenseExpireDate = "",
    this.cityName = "",
    this.addressOffice = "",
    this.tellOffice = "",
    this.lat = "",
    this.long = "",
    this.isIntern = "",
    this.instagram = "",
    this.whatsApp = "",
    this.webSite = "",
    this.nationalCardPicFront = "",
    this.nationalCardPicBack = "",
    this.birthCertificatePic = "",
    this.licensePic = "",
    this.status = '',
    this.createdAt = "",
    this.updatedAt = "",
  });

  factory Profile.fromJson(Map<String, dynamic>? json) => Profile(
        id: asT<int>(json, 'id'),
        userId: asT<String>(json, 'user_id'),
        education: asT<String>(json, 'education'),
        academicDiscipline: asT<String>(json, 'academic_discipline'),
        educationPlace: asT<String>(json, 'education_place'),
        licenseNumber: asT<String>(json, 'license_number'),
        licenseCreateDate: asT<String>(json, 'license_create_date'),
        licenseExpireDate: asT<String>(json, 'license_expire_date'),
        cityName: asT<String>(json, 'city_name'),
        addressOffice: asT<String>(json, 'address_office'),
    tellOffice: asT<String>(json, 'Tell_office'),
        lat: asT<String>(json, 'lat'),
        long: asT<String>(json, 'long'),
        isIntern: asT<String>(json, 'is_intern'),
        instagram: asT<String>(json, 'instagram'),
        whatsApp: asT<String>(json, 'whats_app'),
        webSite: asT<String>(json, 'web_site'),
        nationalCardPicFront: asT<String>(json, 'national_card_pic_front'),
        nationalCardPicBack: asT<String>(json, 'national_card_pic_back'),
        birthCertificatePic: asT<String>(json, 'birth_certificate_pic'),
        licensePic: asT<String>(json, 'license_pic'),
        status: asT<String>(json, 'status'),
        createdAt: asT<String>(json, 'created_at'),
        updatedAt: asT<String>(json, 'updated_at'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'education': education,
        'academic_discipline': academicDiscipline,
        'education_place': educationPlace,
        'license_number': licenseNumber,
        'license_create_date': licenseCreateDate,
        'license_expire_date': licenseExpireDate,
        'city_name': cityName,
        'address_office': addressOffice,
        'Tell_office': tellOffice,
        'lat': lat,
        'long': long,
        'is_intern': isIntern,
        'instagram': instagram,
        'whats_app': whatsApp,
        'web_site': webSite,
        'national_card_pic_front': nationalCardPicFront,
        'national_card_pic_back': nationalCardPicBack,
        'birth_certificate_pic': birthCertificatePic,
        'license_pic': licensePic,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}

class Cards {
  Cards();

  factory Cards.fromJson(Map<String, dynamic>? json) => Cards();

  Map<String, dynamic> toJson() => {};
}
