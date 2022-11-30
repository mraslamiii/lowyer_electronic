import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';

import '../base/safe_convert.dart';

/*
class DetailCategoryModel {
  final int statusCode;
  final bool success;
  final Data data;

  DetailCategoryModel({
    this.statusCode = 0,
    this.success = false,
    required this.data,
  });

  factory DetailCategoryModel.fromJson(Map<String, dynamic>? json) => DetailCategoryModel(
    statusCode: asT<int>(json, 'statusCode'),
    success: asT<bool>(json, 'success'),
    data: Data.fromJson(asT<Map<String, dynamic>>(json, 'data')),
  );

  Map<String, dynamic> toJson() => {
    'statusCode': statusCode,
    'success': success,
    'data': data.toJson(),
  };
}
*/

class DetailCategoryModel {
  final ProfileItem profile;
  final List<ServicesItem> services;
  final List<ServiceCategoriesItem> serviceCategories;
  final List<OptionItem> options;

  DetailCategoryModel({
    required this.profile,
    required this.services,
    required this.serviceCategories,
    required this.options,
  });

  factory DetailCategoryModel.fromJson(Map<String, dynamic>? json) =>
      DetailCategoryModel(
        profile:
            ProfileItem.fromJson(asT<Map<String, dynamic>>(json, 'profile')),
        services: asT<List>(json, 'services')
            .map((e) => ServicesItem.fromJson(e))
            .toList(),
        serviceCategories: asT<List>(json, 'service_categories')
            .map((e) => ServiceCategoriesItem.fromJson(e))
            .toList(),
        options: asT<List>(json, 'options')
            .map((e) => OptionItem.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'profile': profile,
        'services': services.map((e) => e.toJson()),
        'service_categories': serviceCategories.map((e) => e.toJson()),
        'options': options.map((e) => e.toJson()),
      };
}

class ProfileItem {
  final String bussinesTitle;
  final String logo;
  int? id;
  final String headerPic;
  final String acceptorAbout;
  final String status;
  final String video;
  final String bussines_phone;
  final String instagram_page;
  final String tellegram_channel;
  final String website;
  final double lat;
  final double long;
  final List<String> images;

  ProfileItem({
    this.bussinesTitle = "",
    this.id,
    this.logo = "",
    this.headerPic = "",
    this.acceptorAbout = "",
    this.status = "",
    this.video = "",
    this.bussines_phone = "",
    this.instagram_page = "",
    this.tellegram_channel = "",
    required this.images,
    this.website = "",
    this.lat = 0,
    this.long = 0,
  });

  factory ProfileItem.fromJson(Map<String, dynamic>? json) => ProfileItem(
        bussinesTitle: asT<String>(json, 'bussines_title'),
        id: asT<int>(json, 'id'),
        logo: asT<String>(json, 'logo'),
        headerPic: asT<String>(json, 'header_pic'),
        acceptorAbout: asT<String>(json, 'acceptor_about'),
        status: asT<String>(json, 'status'),
        video: asT<String>(json, 'video'),
        images: asT<List<String>>(json, 'images', defaultValue: [""]),
        bussines_phone: asT<String>(json, 'bussines_phone'),
        instagram_page: asT<String>(json, 'instagram_page'),
        tellegram_channel: asT<String>(json, 'tellegram_channel'),
        website: asT<String>(json, 'website'),
        lat: asT<double>(json, 'lat'),
        long: asT<double>(json, 'long'),
      );

  Map<String, dynamic> toJson() => {
        'bussines_title': bussinesTitle,
        'logo': logo,
        'id': id,
        'header_pic': headerPic,
        'acceptor_about': acceptorAbout,
        'status': status,
        'video': video,
        'images': images,
        'bussines_phone': bussines_phone,
        'instagram_page': instagram_page,
        'tellegram_channel': tellegram_channel,
        'website': website,
        'lat': lat,
        'long': long,
      };
}

class ServicesItem {
  final int id;
  final String acceptorProfileId;
  final String serviceName;
  final String description;
  final String discount;
  final String companyShares;
  final String lawyerCenter;
  final String price;
  final String startDate;
  final String endDate;
  final String image;
  final String status;
  final String createdAt;
  final String updatedAt;

  ServicesItem({
    this.id = 0,
    this.acceptorProfileId = "",
    this.serviceName = "",
    this.description = "",
    this.discount = "",
    this.companyShares = "",
    this.lawyerCenter = "",
    this.price = "",
    this.startDate = "",
    this.endDate = "",
    this.image = "",
    this.status = "",
    this.createdAt = "",
    this.updatedAt = "",
  });

  factory ServicesItem.fromJson(Map<String, dynamic>? json) => ServicesItem(
        id: asT<int>(json, 'id'),
        acceptorProfileId: asT<String>(json, 'acceptor_profile_id'),
        serviceName: asT<String>(json, 'service_name'),
        description: asT<String>(json, 'description'),
        discount: asT<String>(json, 'discount'),
        companyShares: asT<String>(json, 'company_shares'),
        lawyerCenter: asT<String>(json, 'lawyer_center'),
        price: asT<String>(json, 'price'),
        startDate: asT<String>(json, 'start_date'),
        endDate: asT<String>(json, 'end_date'),
        image: asT<String>(json, 'image'),
        status: asT<String>(json, 'status'),
        createdAt: asT<String>(json, 'created_at'),
        updatedAt: asT<String>(json, 'updated_at'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'acceptor_profile_id': acceptorProfileId,
        'service_name': serviceName,
        'description': description,
        'discount': discount,
        'company_shares': companyShares,
        'lawyer_center': lawyerCenter,
        'price': price,
        'start_date': startDate,
        'end_date': endDate,
        'image': image,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}

class OptionItem {
  final int id;
  final String acceptorProfileId;
  final String title;
  final String description;

  OptionItem({
    this.id = 0,
    this.acceptorProfileId = "",
    this.title = "",
    this.description = "",
  });

  factory OptionItem.fromJson(Map<String, dynamic>? json) => OptionItem(
        id: asT<int>(json, 'id'),
        acceptorProfileId: asT<String>(json, 'acceptor_profile_id'),
        title: asT<String>(json, 'title'),
        description: asT<String>(json, 'description'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'acceptor_profile_id': acceptorProfileId,
        'title': title,
        'description': description,
      };
}

class ServiceCategoriesItem {
  final String title;

  ServiceCategoriesItem({
    this.title = "",
  });

  factory ServiceCategoriesItem.fromJson(Map<String, dynamic>? json) =>
      ServiceCategoriesItem(
        title: asT<String>(json, 'title'),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };
}
