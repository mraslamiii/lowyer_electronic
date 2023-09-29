

import '../base/safe_convert.dart';

class GetAllCategoryModel {
  final int statusCode;
  final bool success;
  final List<DataItem> data;

  GetAllCategoryModel({
    this.statusCode = 0,
    this.success = false,
    required this.data,
  });

  factory GetAllCategoryModel.fromJson(Map<String, dynamic>? json) => GetAllCategoryModel(
    statusCode: asT<int>(json, 'statusCode'),
    success: asT<bool>(json, 'success'),
    data: asT<List>(json, 'data').map((e) => DataItem.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'statusCode': statusCode,
    'success': success,
    'data': data.map((e) => e.toJson()),
  };
}

class DataItem {
  final int id;
  final String userId;
  final String bussinesTitle;
  final String licenseNumber;
  final String licensor;
  final String instagramPage;
  final String tellegramChannel;
  final String website;
  final String bussinesPhone;
  final dynamic managerPhone;
  final dynamic reservationPhone;
  final String acceptorAddress;
  final String lat;
  final String long;
  final String logo;
  final dynamic nationalCardPicFront;
  final dynamic nationalCardPicBack;
  final dynamic birthCertificatePic;
  final dynamic licensePic;
  final String headerPic;
  final String acceptorAbout;
  final String status;
  final String marketer;
  final String video;
  final String createdAt;
  final String updatedAt;

  DataItem({
    this.id = 0,
    this.userId = "",
    this.bussinesTitle = "",
    this.licenseNumber = "",
    this.licensor = "",
    this.instagramPage = "",
    this.tellegramChannel = "",
    this.website = "",
    this.bussinesPhone = "",
    this.managerPhone,
    this.reservationPhone,
    this.acceptorAddress = "",
    this.lat = "",
    this.long = "",
    this.logo = "",
    this.nationalCardPicFront,
    this.nationalCardPicBack,
    this.birthCertificatePic,
    this.licensePic,
    this.headerPic = "",
    this.acceptorAbout = "",
    this.status = "",
    this.marketer = "",
    this.video = "",
    this.createdAt = "",
    this.updatedAt = "",
  });

  factory DataItem.fromJson(Map<String, dynamic>? json) => DataItem(
    id: asT<int>(json, 'id'),
    userId: asT<String>(json, 'user_id'),
    bussinesTitle: asT<String>(json, 'bussines_title'),
    licenseNumber: asT<String>(json, 'license_number'),
    licensor: asT<String>(json, 'licensor'),
    instagramPage: asT<String>(json, 'instagram_page'),
    tellegramChannel: asT<String>(json, 'tellegram_channel'),
    website: asT<String>(json, 'website'),
    bussinesPhone: asT<String>(json, 'bussines_phone'),
    managerPhone: asT<dynamic>(json, 'manager_phone'),
    reservationPhone: asT<dynamic>(json, 'reservation_phone'),
    acceptorAddress: asT<String>(json, 'acceptor_address'),
    lat: asT<String>(json, 'lat'),
    long: asT<String>(json, 'long'),
    logo: asT<String>(json, 'logo'),
    nationalCardPicFront: asT<dynamic>(json, 'national_card_pic_front'),
    nationalCardPicBack: asT<dynamic>(json, 'national_card_pic_back'),
    birthCertificatePic: asT<dynamic>(json, 'birth_certificate_pic'),
    licensePic: asT<dynamic>(json, 'license_pic'),
    headerPic: asT<String>(json, 'header_pic'),
    acceptorAbout: asT<String>(json, 'acceptor_about'),
    status: asT<String>(json, 'status'),
    marketer: asT<String>(json, 'marketer'),
    video: asT<String>(json, 'video'),
    createdAt: asT<String>(json, 'created_at'),
    updatedAt: asT<String>(json, 'updated_at'),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'bussines_title': bussinesTitle,
    'license_number': licenseNumber,
    'licensor': licensor,
    'instagram_page': instagramPage,
    'tellegram_channel': tellegramChannel,
    'website': website,
    'bussines_phone': bussinesPhone,
    'manager_phone': managerPhone,
    'reservation_phone': reservationPhone,
    'acceptor_address': acceptorAddress,
    'lat': lat,
    'long': long,
    'logo': logo,
    'national_card_pic_front': nationalCardPicFront,
    'national_card_pic_back': nationalCardPicBack,
    'birth_certificate_pic': birthCertificatePic,
    'license_pic': licensePic,
    'header_pic': headerPic,
    'acceptor_about': acceptorAbout,
    'status': status,
    'marketer': marketer,
    'video': video,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

