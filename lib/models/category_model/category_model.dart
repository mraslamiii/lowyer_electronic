

import '../base/safe_convert.dart';

class CategoryModel {
  final int statusCode;
  final bool success;
  final AcceptorCategoryModel data;

  CategoryModel({
    this.statusCode = 0,
    this.success = false,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic>? json) => CategoryModel(
    statusCode: asT<int>(json, 'statusCode'),
    success: asT<bool>(json, 'success'),
    data: AcceptorCategoryModel.fromJson(asT<Map<String, dynamic>>(json, 'data')),
  );

  Map<String, dynamic> toJson() => {
    'statusCode': statusCode,
    'success': success,
    'data': data.toJson(),
  };
}

class AcceptorCategoryModel {
  final List<AcceptorsItem> acceptors;
  final List<CategoriesItem> categories;

  AcceptorCategoryModel({
    required this.acceptors,
    required this.categories,
  });

  factory AcceptorCategoryModel.fromJson(Map<String, dynamic>? json) => AcceptorCategoryModel(
    acceptors: asT<List>(json, 'acceptors').map((e) => AcceptorsItem.fromJson(e)).toList(),
    categories: asT<List>(json, 'categories').map((e) => CategoriesItem.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'acceptors': acceptors.map((e) => e.toJson()),
    'categories': categories.map((e) => e.toJson()),
  };
}



class CategoryAcceptorCategoryModel {
  final List<AcceptorsItem> acceptors;

  CategoryAcceptorCategoryModel({
    required this.acceptors,
  });

  factory CategoryAcceptorCategoryModel.fromJson(Map<String, dynamic>? json) => CategoryAcceptorCategoryModel(
    acceptors: asT<List>(json, 'acceptors').map((e) => AcceptorsItem.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'acceptors': acceptors.map((e) => e.toJson()),
  };
}


class AcceptorsItem {
  final String bussinesTitle;
  final dynamic logo;
  final String headerPic;
  int? id;
  final String acceptorAbout;
  final String status;

  AcceptorsItem({
    this.bussinesTitle = "",
    this.id,
    this.logo,
    this.headerPic = "",
    this.acceptorAbout = "",
    this.status = "",
  });

  factory AcceptorsItem.fromJson(Map<String, dynamic>? json) => AcceptorsItem(
    bussinesTitle: asT<String>(json, 'bussines_title'),
    logo: asT<dynamic>(json, 'logo'),
    id: asT<int>(json, 'id'),
    headerPic: asT<String>(json, 'header_pic'),
    acceptorAbout: asT<String>(json, 'acceptor_about'),
    status: asT<String>(json, 'status'),
  );

  Map<String, dynamic> toJson() => {
    'bussines_title': bussinesTitle,
    'logo': logo,
    'id':id,
    'header_pic': headerPic,
    'acceptor_about': acceptorAbout,
    'status': status,
  };
}


class CategoriesItem {
  final String title;
  final String image;
  final int id;
  final dynamic parentId;

  CategoriesItem({
    this.title = "",
    this.image = "",
    this.id = 0,
    this.parentId,
  });

  factory CategoriesItem.fromJson(Map<String, dynamic>? json) => CategoriesItem(
    title: asT<String>(json, 'title'),
    image: asT<String>(json, 'image'),
    id: asT<int>(json, 'id'),
    parentId: asT<dynamic>(json, 'parent_id'),
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'parent_id': parentId,
    'id': id,
    'image': image,
  };
}

