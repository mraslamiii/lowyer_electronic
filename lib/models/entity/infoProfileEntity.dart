import '../lawyer/info_profile_model.dart';

class InfoProfileEntity{
   int? statusCode;
   bool? success;
   LawyerData? data;
  InfoProfileEntity({
    this.success,
    this.statusCode,
    this.data,

  });
}