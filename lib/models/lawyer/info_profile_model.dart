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

  Map<String, dynamic> toJson() =>
      {
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
  final List<CardsItem>? cards;

  LawyerData({
    this.user,
    this.profile,
    this.cards,
  });

  factory LawyerData.fromJson(Map<String, dynamic>? json) =>
      LawyerData(
          user: User.fromJson(asT<Map<String, dynamic>>(json, 'user')),
          profile: Profile.fromJson(asT<Map<String, dynamic>>(json, 'profile')),
          cards: CardsItem.fromJsonList(asT<List>(json, 'cards'))

  // cards: asT<List>(json, 'cards').map((e) => CardsItem.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() =>
      {
        'user': user?.toJson(),
        'profile': profile?.toJson(),
        'cards': cards?.map((e) => e),
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

  factory User.fromJson(Map<String, dynamic>? json) =>
      User(
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

  Map<String, dynamic> toJson() =>
      {
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

/*
class Profile extends ProfileEntity {
  Profile({
    int? id,
    String? userId,
    String? education,
    String? academicDiscipline,
    String? educationPlace,
    String? licenseNumber,
    String? licenseCreateDate,
    String? licenseExpireDate,
    String? cityName,
    String? addressOffice,
    String? tellOffice,
    String? lat,
    String? long,
    String? isIntern,
    String? instagram,
    String? whatsApp,
    String? webSite,
    String? nationalCardPicFront,
    String? nationalCardPicBack,
    String? birthCertificatePic,
    String? licensePic,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) : super(
          id: id ?? 0,
          userId: userId ?? '',
          education: education ?? '',
          academicDiscipline: academicDiscipline ?? '',
          educationPlace: educationPlace ?? '',
          licenseNumber: licenseNumber ?? '',
          licenseCreateDate: licenseCreateDate ?? '',
          licenseExpireDate: licenseExpireDate ?? '',
          cityName: cityName ?? '',
          addressOffice: addressOffice ?? '',
          tellOffice: tellOffice ?? '',
          lat: lat ?? '',
          long: long ?? '',
          isIntern: isIntern ?? '',
          instagram: instagram ?? '',
          whatsApp: whatsApp ?? '',
          webSite: webSite ?? '',
          nationalCardPicFront: nationalCardPicFront ?? '',
          nationalCardPicBack: nationalCardPicBack ?? '',
          birthCertificatePic: birthCertificatePic ?? '',
          licensePic: licensePic ?? '',
          status: status ?? '',
          createdAt: createdAt ?? '',
          updatedAt: updatedAt ?? '',
        );

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

  factory Profile.fromEntity(final ProfileEntity item) {
    return Profile(
        id: item.id,
        userId: item.userId,
        academicDiscipline: item.academicDiscipline,
        tellOffice: item.tellOffice,
        addressOffice: item.addressOffice,
        cityName: item.cityName,
        licenseExpireDate: item.licenseExpireDate,
        licenseCreateDate: item.licenseCreateDate,
        educationPlace: item.educationPlace,
        education: item.education,
        licenseNumber: item.licenseNumber,
        status: item.status,
        birthCertificatePic: item.birthCertificatePic,
        createdAt: item.createdAt,
        instagram: item.instagram,
        isIntern: item.isIntern,
        lat: item.lat,
        licensePic: item.licensePic,
        long: item.long,
        nationalCardPicBack: item.nationalCardPicBack,
        nationalCardPicFront: item.nationalCardPicFront,
        updatedAt: item.updatedAt,
        webSite: item.webSite,
        whatsApp: item.whatsApp);
  }
}
*/
class Profile {
  int id;
  String userId;
  String education;
  String academicDiscipline;
  String educationPlace;
  String licenseNumber;
  String licenseCreateDate;
  String licenseExpireDate;
  String cityName;
  String addressOffice;
  String TellOffice;
  String lat;
  String long;
  String isIntern;
  String instagram;
  String whatsApp;
  String webSite;
  String nationalCardPicFront;
  String nationalCardPicBack;
  String birthCertificatePic;
  String licensePic;
  String status;
  String createdAt;
  String updatedAt;

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
    this.TellOffice = "",
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

  factory Profile.fromJson(Map<String, dynamic>? json) =>
      Profile(
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
        TellOffice: asT<String>(json, 'Tell_office'),
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

  Map<String, dynamic> toJson() =>
      {
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
        'Tell_office': TellOffice,
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

class CardsModel {
  List<CardsItem>? cards;

  CardsModel({
    this.cards,
  });

  factory CardsModel.fromJson(Map<String, dynamic>? json) =>
      CardsModel(
        cards:
        asT<List>(json, 'cards').map((e) => CardsItem.fromJson(e)).toList(),
      );

  Map<String, dynamic> toJson() =>
      {
        'cards': cards?.map((e) => e.toJson()),
      };
}

class CardsItem {
  int id;
  String lawyerProfileId;
  String cardNumber;
  String issueDate;
  String expirationDate;
  dynamic deliverDate;
  dynamic delivery;
  String status;
  dynamic comment;
  dynamic deliverFile;
  String createUserId;
  dynamic updateUserId;
  String createdAt;
  String updatedAt;

  CardsItem({
    this.id = 0,
    this.lawyerProfileId = "",
    this.cardNumber = "",
    this.issueDate = "",
    this.expirationDate = "",
    this.deliverDate,
    this.delivery,
    this.status = "",
    this.comment,
    this.deliverFile,
    this.createUserId = "",
    this.updateUserId,
    this.createdAt = "",
    this.updatedAt = "",
  });

  factory CardsItem.fromJson(Map<String, dynamic>? json) =>
      CardsItem(
        id: asT<int>(json, 'id'),
        lawyerProfileId: asT<String>(json, 'lawyer_profile_id'),
        cardNumber: asT<String>(json, 'card_number'),
        issueDate: asT<String>(json, 'issue_date'),
        expirationDate: asT<String>(json, 'expiration_date'),
        deliverDate: asT<dynamic>(json, 'deliver_date'),
        delivery: asT<dynamic>(json, 'delivery'),
        status: asT<String>(json, 'status'),
        comment: asT<dynamic>(json, 'comment'),
        deliverFile: asT<dynamic>(json, 'deliver_file'),
        createUserId: asT<String>(json, 'create_user_id'),
        updateUserId: asT<dynamic>(json, 'update_user_id'),
        createdAt: asT<String>(json, 'created_at'),
        updatedAt: asT<String>(json, 'updated_at'),
      );

  static List<CardsItem> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((_json) {
        var a = CardsItem.fromJson(_json);

        return a;
      }).toList();

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'lawyer_profile_id': lawyerProfileId,
        'card_number': cardNumber,
        'issue_date': issueDate,
        'expiration_date': expirationDate,
        'deliver_date': deliverDate,
        'delivery': delivery,
        'status': status,
        'comment': comment,
        'deliver_file': deliverFile,
        'create_user_id': createUserId,
        'update_user_id': updateUserId,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}

class Cards {
  Cards();

  factory Cards.fromJson(Map<String, dynamic>? json) => Cards();

  Map<String, dynamic> toJson() => {};
}
