

import '../base/safe_convert.dart';

class CardHistoryModel {
  final int statusCode;
  final bool success;
  final List<CardListRequestModel> data;

  CardHistoryModel({
    this.statusCode = 0,
    this.success = false,
    required this.data,
  });

  factory CardHistoryModel.fromJson(Map<String, dynamic>? json) => CardHistoryModel(
    statusCode: asT<int>(json, 'statusCode'),
    success: asT<bool>(json, 'success'),
    data: asT<List>(json, 'data').map((e) => CardListRequestModel.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'statusCode': statusCode,
    'success': success,
    'data': data.map((e) => e.toJson()),
  };
}

class CardListRequestModel {
  final int id;
  final String requestType;
  final String status;
  final String lawyerProfileId;
  final String description;
  final String createUserId;
  final dynamic updateUserId;
  final String createdAt;
  final String updatedAt;


  CardListRequestModel({
    this.id = 0,
    this.requestType = "",
    this.status = "",
    this.lawyerProfileId = "",
    this.description = "",
    this.createUserId = "",
    this.updateUserId,
    this.createdAt = "",
    this.updatedAt = "",
  });

  factory CardListRequestModel.fromJson(Map<String, dynamic>? json) => CardListRequestModel(
    id: asT<int>(json, 'id'),
    requestType: asT<String>(json, 'request_type'),
    status: asT<String>(json, 'status'),
    lawyerProfileId: asT<String>(json, 'lawyer_profile_id'),
    description: asT<String>(json, 'description'),
    createUserId: asT<String>(json, 'create_user_id'),
    updateUserId: asT<dynamic>(json, 'update_user_id'),
    createdAt: asT<String>(json, 'created_at'),
    updatedAt: asT<String>(json, 'updated_at'),

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'request_type': requestType,
    'status': status,
    'lawyer_profile_id': lawyerProfileId,
    'description': description,
    'create_user_id': createUserId,
    'update_user_id': updateUserId,
    'created_at': createdAt,
    'updated_at': updatedAt,

  };
}

